import Joi from "joi";

const schema = Joi.object({
  page: Joi.number().integer().min(1).optional(),
  page_size: Joi.number().integer().min(1).optional(),
});

export default schema;
