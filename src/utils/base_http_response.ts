type ResponseWithData<T> = {
  error: boolean;
  message?: string;
  data: T;
};

export function responseWithData<T>(props: {
  error?: boolean;
  message?: string;
  data: T;
}): ResponseWithData<T> {
  return {
    error: props.error || false,
    message: props.message || "Response got successfully",
    data: props.data,
  };
}
