/**
 * Install brew deps
 * deps may be specified as "binary_name" or "name_on_PATH::install_term"
 */
const cp = require("child_process");
const to_install = process.argv.splice(2);

function next() {
  if (to_install.length === 0) {
    return;
  }
  const dep = to_install.pop();
  const [checkName, installName = dep] = dep.split("::");
  cp.exec(`command -v "${checkName}" &> /dev/null`, (errCmdNotFound, res) =>
    errCmdNotFound ? cp.spawn(`brew`, ["install", installName], { stdio: "inherit" }, next) : next()
  );
}

next();
