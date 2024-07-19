export function dbDateFormat(timestamp: number) {
  const date = new Date(timestamp);
  const year = String(date.getFullYear()).padStart(2, "0");
  const month = String(date.getMonth()).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  const seconds = String(date.getSeconds()).padStart(2, "0");
  const miliSeconds = String(date.getMilliseconds() * 100).padStart(8, "0");

  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}.${miliSeconds}+06`;
}
