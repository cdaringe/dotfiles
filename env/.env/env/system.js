// fd plist /Library/Application\ Support/Websense\ Endpoint/  -x launchctl unload {}
const fs = require("fs/promises");
const path = require("path");

const [cmd, ...args] = process.argv.slice(2);

async function go() {
  const isHelp = () => args.find((v) => v.match(/-h|--help/));
  const isForce = () => args.find((v) => v.match(/-f|--force/));
  if (isHelp()) {
    console.log(`
    $ system.js - system tools (really, shell tools)
  
    -h get help
    -f force
  
    $ system.js indianajonesswap <to-swap> <swap-with>
      swap-with is currently unsupported, and ATM just writes
      an empty shell daemon like file, matching
  `);
    process.exit(1);
  }
  if (cmd === "indianajonesswap") {
    const [toSwap] = args;
    const bakFilename = `${toSwap}.bak`;
    await fs.stat(bakFilename).then(
      () => {
        if (isForce()) {
          /* pass */
        } else {
          throw new Error(`bak file ${bakFilename} already exists. do you want to --force?`);
        }
      },
      (err) => {
        /* pass */
      }
    );
    const stat = await fs.stat(toSwap);
    if (!stat.isFile()) {
      throw new Error(`${toSwap} is not of type file`);
    }
    await fs.rename(toSwap, bakFilename);
    await fs.writeFile(
      toSwap,
      `#!/bin/bash
while :
do
  sleep 10000
done`
    );
    await fs.chmod(toSwap, stat.mode);
  } else {
    throw new Error(`cmd not found. got args: ${process.argv}`);
  }
}

go();
