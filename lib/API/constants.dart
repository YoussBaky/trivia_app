library constants;

const API_BASIC_URL_FORMAT = 'https://opentdb.com/api.php?amount=10';

const API_QUESTIONS_DIFFICULTY = ['Any', 'easy', 'medium', 'hard'];

const API_QUESTIONS_AMOUNT = [10, 20, 30, 40, 50];

const API_QUESTIONS_TYPE = ['multiple', 'boolean'];

/**
 * Session Tokens are unique keys that will help keep track of the questions 
 * the API has already retrieved. By appending a Session Token to a API Call,
 *  the API will never give you the same question twice.
 * 
 * Code 0: Success Returned results successfully.
 * Code 1: No Results Could not return results.
 * Code 2: Invalid Parameter Contains an invalid parameter.
 * Code 3: Token Not Found Session Token does not exist.
 * Code 4: Token Empty Session Token has returned all possible questions for the specified query.
 */
///Retrieve a Session Token:
const API_TOKEN_GENERATOR = 'https://opentdb.com/api_token.php?command=request';

///Using a Session Token
const API_USE_TOKEN_FORMAT =
    'https://opentdb.com/api.php?amount=10&token=YOURTOKENHERE';

const API_RESET_TOKEN_FORMAT =
    'https://opentdb.com/api_token.php?command=reset&token=YOURTOKENHERE';

/**
 * Helper API Tools
 * There are some functions in the API which can be useful to developers.
 */

/// Returns the entire list of categories and ids in the database.
const API_GET_CATEGORYS = 'https://opentdb.com/api_category.php';

///Returns the number of questions in the database, in a specific category.
const API_CATEGORY_QUESTION_COUNT_FORMAT =
    'https://opentdb.com/api_count.php?category=CATEGORY_ID_HERE';

///  Returns the number of ALL questions in the database.
///  Total, Pending, Verified, and Rejected.
const API_DB_QUESTIONS_COUNT = 'https://opentdb.com/api_count_global.php';
