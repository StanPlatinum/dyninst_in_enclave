#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "Enclave.h"
#include "Enclave_t.h"

/* for my own uses... */

/* My private Enclave functions */
void PrintDebugInfo(const char *fmt, ...)
{
        char buf[BUFSIZ] = {'\0'};
        va_list ap;
        va_start(ap, fmt);
        vsnprintf(buf, BUFSIZ, fmt, ap);
        va_end(ap);
        Ocall_PrintString(buf);
}

#include <string>
//#include <sstream>
//#include <random>
#include <memory>

float calcVolatility(float spotPrice, int timesteps)
{
	        std::string line = "99.80311647,99.72990912,99.65636726,99.6556732,99.69786154,99.74150906,99.73389665,99.79820824,99.79761168,99.79823002,99.79823002,99.78262647,99.78262647,99.78262647,99.73969133,99.73773184,99.73797132,99.73490099,99.73490099,99.73490099,99.734149,99.734149,99.77562657,99.7592583,99.75836796,99.71464245,99.71464245,99.71562527,99.64409042,99.62799208,99.62799208,99.62799208,99.62799208,99.57002365,99.66995111,99.66896711,99.68228756,99.68365737,99.66949599,99.56961951,99.56893026,99.56844997,99.56717845,99.56717845,99.63750043,99.56438822,99.49161966,99.29320141,99.27805847,99.29122139,99.29122139,99.29122139,99.29057403,99.36138729,99.36223967,99.36223967,99.31930126,99.20495047,99.13329905,99.13339801,98.77920303,98.82217857,98.82098415,98.80793197,98.80830788,98.84958174,98.84852822,98.84852822,98.57965834,98.28474207,98.29742855,98.29860256,98.29842983,98.28496445,97.93797363,97.92403829,97.93724476,97.93919152,97.92627805,97.97024764,97.96947664,97.97006179,97.99765621,97.98403421,97.97144908,97.97192716,97.97139071,97.80561647,97.59646317,97.736,97.8226,97.8727,97.872,97.8722,97.8693,97.8675,97.8656,97.8617,97.8596,97.8676,97.8772,97.8849,97.8893,97.8925,97.8952,97.8981,97.9011,97.9043,97.9078,97.9115,97.9153,97.919,97.9225,97.9257,97.9289,97.9321,97.9352,97.9384,97.9415,97.9446,97.9477,97.9507,97.9537,97.9566,97.9595,97.9623,97.9652,97.968,97.9707,97.9735,97.9762,97.9788,97.9815,97.984,97.9866,97.9891,97.9916,97.9941,97.9965,97.9989,98.0013,98.0036,98.0059,98.0082,98.0105,98.0127,98.0149,98.0171,98.0192,98.0214,98.0234,98.0255,98.0275,98.0295,98.0316,98.0335,98.0354,98.0374,98.0393,98.0411,98.043,98.0448,98.0466,98.0484,98.0501,98.0519,98.0536,98.0553,98.0569,98.0586,98.0602,98.0618,98.0634,98.0649,98.0665,98.0681,98.0696,98.0711,98.0726";

        int i = 0, len = timesteps - 1;
        std::unique_ptr<float[]> priceArr = std::make_unique<float[]>(timesteps - 1);
        std::istringstream iss(line);
        std::string token;

        //! Get the return values of stock from file (min 2 to 180)
        while (std::getline(iss, token, ','))
                priceArr[i++] = std::stof(token);

        float sum = spotPrice;
        //! Find mean of the estimated minute-end prices
        for (i = 0; i < len; i++)
                sum += priceArr[i];
        float meanPrice = sum / (len + 1);

        //! Calculate market volatility as standard deviation
        sum = powf((spotPrice - meanPrice), 2.0f);
        for (i = 0; i < len; i++)
                sum += powf((priceArr[i] - meanPrice), 2.0f);

        float stdDev = sqrtf(sum);

        //! Return as percentage
        return (stdDev / 100.0f);
}

float * find2DMean(float **matrix, int numLoops, int timesteps)
{
        int j;
        float* avg = new float[timesteps];
        float sum = 0.0f;

        for (int i = 0; i < timesteps; i++)
        {
                /**
                A private copy of 'sum' variable is created for each thread.
                At the end of the reduction, the reduction variable is applied to all private copies of the shared variable, and the final result is written to the global shared variable.
                */
                for (j = 0; j < numLoops; j++)
                {
                        sum += matrix[j][i];
                }
                //! Calculating average across columns
                avg[i] = sum / numLoops;
                sum = 0.0f;
        }
        return avg;
}

/** ---------------------------------------------------------------------------
  Generates a random number seeded by system clock based on standard
  normal distribution on taking mean 0.0 and standard deviation 1.0
  ----------------------------------------------------------------------------*/
//Weijie: test
unsigned long int seed = 1;

float randGen(float mean, float stdDev)
{
        //Weijie: we cannot use sys clock ...
        //So here we set seed starting with 1 ...
        //auto seed = std::chrono::system_clock::now().time_since_epoch().count();
        seed++;
        if (seed > 4294967295)  seed = 1;
        //std::cout << "seed: " << seed << std::endl;

        std::default_random_engine generator(static_cast<unsigned int>(seed));
        std::normal_distribution<float> distribution(mean, stdDev);
        return distribution(generator);
}

float * runBlackScholesModel(float spotPrice, int timesteps, float riskRate, float volatility)
{
        float  mean = 0.0f, stdDev = 1.0f;                      //! Mean and standard deviation
        float  deltaT = 1.0f / timesteps;                       //! Timestep
        std::unique_ptr<float[]> normRand = std::make_unique<float[]>(timesteps - 1);   //! Array of normally distributed random nos.
        //Weijie: use my own make_unique
        //std::unique_ptr<float[]> normRand = make_unique<float[]>(timesteps - 1);      //! Array of normally distributed random nos.
        float* stockPrice = new float[timesteps];       //! Array of stock price at diff. times
        stockPrice[0] = spotPrice;                                      //! Stock price at t=0 is spot price

        //! Populate array with random nos.
        for (int i = 0; i < timesteps - 1; i++)
                normRand[i] = randGen(mean, stdDev);

        //! Apply Black Scholes equation to calculate stock price at next timestep
        for (int i = 0; i < timesteps - 1; i++)
                stockPrice[i + 1] = stockPrice[i] * exp(((riskRate - (powf(volatility, 2.0f) / 2.0f)) * deltaT) + (volatility * normRand[i] * sqrtf(deltaT)));

        return stockPrice;
}

void Ecall_stock_main(void)
{
        int inLoops = 100;	//! Inner loop iterations
        int outLoops = 10000;   //! Outer loop iterations
        int timesteps = 180;    //! Stock market time-intervals (min)

        //! Matrix for stock-price vectors per iteration
        float **stock = new float *[inLoops];
        for (int i = 0; i < inLoops; i++)
                stock[i] = new float[timesteps];

        //! Matrix for mean of stock-price vectors per iteration
        float **avgStock = new float*[outLoops];
        for (int i = 0; i < outLoops; i++)
                avgStock[i] = new float[timesteps];

        //! Vector for most likely outcome stock price
        float *optStock = new float[timesteps];

        float riskRate = 0.001f;        //! Risk free interest rate (%)
        float spotPrice = 100.0f;       //! Spot price (at t = 0)

        //! Market volatility (calculated from ml_data.csv)
        float volatility = calcVolatility(spotPrice, timesteps);

        int i;
        for (i = 0; i < outLoops; i++)
        {
                for (int j = 0; j < inLoops; j++)
                        stock[j] = runBlackScholesModel(spotPrice, timesteps, riskRate, volatility);

                avgStock[i] = find2DMean(stock, inLoops, timesteps);
        }
        optStock = find2DMean(avgStock, outLoops, timesteps);

        for (i = 0; i < inLoops; i++)
                delete[] stock[i];
        delete[] stock;

        for (i = 0; i < outLoops; i++)
                delete[] avgStock[i];
        delete[] avgStock;

        delete[] optStock;
}
