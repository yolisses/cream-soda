import { config } from "dotenv";
config();

const { SERVER_URL, PASSWORD, USERNAME } = process.env;

export { SERVER_URL, PASSWORD, USERNAME };
