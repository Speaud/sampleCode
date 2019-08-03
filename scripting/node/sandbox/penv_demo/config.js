import dotenv from 'dotenv'; 
 
// Instantiate dotenv instance - Pulls values from .env file in environment
const result = dotenv.config();

// Declare default configuration behavior based off of .env if applicable
const CONFIG = { 
    PROPNAME: process.env.PROPNAME || "default_value"
};

export default CONFIG;