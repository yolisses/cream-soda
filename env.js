import { config } from "dotenv";
config();

const { SERVER_SSH_URL, SERVER_SSH_PORT, PASSWORD, USERNAME, HOST_SSH_URL } =
  process.env;

export { SERVER_SSH_URL, SERVER_SSH_PORT, PASSWORD, USERNAME, HOST_SSH_URL };
