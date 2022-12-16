import { NodeSSH } from "node-ssh";
import { PASSWORD, SERVER_SSH_PORT, SERVER_SSH_URL, USERNAME } from "./env";
import { servers } from "./servers";
import { tcpStrategies } from "./tcpStrategies";

const hostSsh = new NodeSSH();
const serverSsh = new NodeSSH();

function onStdout(buffer) {
  console.log(buffer.toString());
}

async function run() {
  await serverSsh.connect({
    password: PASSWORD,
    username: USERNAME,
    host: SERVER_SSH_URL,
    port: parseInt(SERVER_SSH_PORT),
  });

  await hostSsh.connect({
    password: PASSWORD,
    username: USERNAME,
    host: SERVER_SSH_URL,
    port: parseInt(SERVER_SSH_PORT),
  });

  let res;
  res = await serverSsh.exec("echo", ["it's alive"]);

  for (const server of servers) {
    await serverSsh.exec("./setServer.sh", [server], { onStdout });
    for (const strategy of tcpStrategies) {
      await serverSsh.exec("./setTcpStrategy.sh", [strategy], { onStdout });
      await serverSsh.exec("./runTraffic.sh", [], { onStdout });
    }
  }
}

run();
