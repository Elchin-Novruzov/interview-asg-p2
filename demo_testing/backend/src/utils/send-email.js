const { Resend } = require("resend");
const { env } = require("../config");
const { ApiError } = require("./api-error");

let resend = null;
try {
  if (env.RESEND_API_KEY && !env.RESEND_API_KEY.startsWith('re_your_')) {
    resend = new Resend(env.RESEND_API_KEY);
  }
} catch (error) {
  console.warn('Email service not configured');
}

const sendMail = async (mailOptions) => {
  if (!resend) {
    console.warn('Email not configured');
    return;
  }
  
  const { error } = await resend.emails.send(mailOptions);
  if (error) {
    throw new ApiError(500, "Unable to send email");
  }
};

module.exports = {
  sendMail,
};
