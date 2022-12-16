import { NodeSSH } from "node-ssh";
import { PASSWORD, SERVER_URL, USERNAME } from "./env";

const ssh = new NodeSSH();

async function run() {
  await ssh.connect({
    port: 13768,
    host: SERVER_URL,
    password: PASSWORD,
    username: USERNAME,
  });

  let res;
  res = await ssh.exec("echo", ["it's alive"]);
  res = await ssh.exec("sudo su", [], {
    stdin: password + "\n",
    onStdout: (chunk) => console.log(chunk.toString()),
    execOptions: { pty: true, allowHalfOpen: true },
  });
  console.log(res);
  // await ssh.exec("echo 654123 |sudo -S su", []);
  res = await ssh.exec(
    "echo cubic > /proc/sys/net/ipv4/tcp_congestion_control",
    [],
    {
      stdin: password + "\n",
      execOptions: { pty: true },
    }
  );
  console.log(res);
  // await ssh.exec("docker exec -it frosty_mcnulty /bin/bash", []);
  ssh.dispose();
}

run();
