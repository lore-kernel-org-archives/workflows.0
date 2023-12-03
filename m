Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B4F9FC;
	Sun,  3 Dec 2023 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rtj1dLW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF0FC433C7;
	Sun,  3 Dec 2023 13:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701610929;
	bh=mbxTHv6Qvi10JLVFd8u2eKaacZsv0OpYjjITx+PFz6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtj1dLW60uFtiVFn6yTb7Uv3RNAdqDo7SpgtU/qL0Q6zHy0oYdXW1UsL+V+Wx4m1l
	 4/zfYP/5Na55IRX1IrnBWHWNa65ihmQMmkCuJEz3Z7AIAXYOdOStux5oQLGbD7RJsx
	 PrfpugvBP+N1IUWnYX7GAMFTtDI45JOL4qvbkoZM=
Date: Sun, 3 Dec 2023 14:42:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: attreyee-muk <tintinm2017@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Sounds better
Message-ID: <2023120329-paralyses-rewash-ef0e@gregkh>
References: <20231203133017.18311-1-tintinm2017@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203133017.18311-1-tintinm2017@gmail.com>

On Sun, Dec 03, 2023 at 07:00:18PM +0530, attreyee-muk wrote:
> Respected Maintainers, 
> 
> I have made a small change in the submitting-patches.rst document. I was
> reading the submitting-patches.rst file as I needed to understand
> certain things for submitting patches. That is when I found this. 
> It might not be a very sigificant change, but I think it just improves a
> bit of a readability and I feel that "Don't get discouraged, or become impatient"
> sounds better.
> 
> Hence, sending this patch. Requesting the maintains to have a look at
> it. 
> 
> Thank You
> Attreyee Mukehrjee 
> 
> Signed-off-by: Attreyee Mukherjee <tintinm2017@gmail.com>
> ---
>  Documentation/process/submitting-patches.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 86d346bcb8ef..f524e63fb429 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -360,7 +360,7 @@ space. For more details see: http://daringfireball.net/2007/07/on_top ::
>  
>  .. _resend_reminders:
>  
> -Don't get discouraged - or impatient
> +Don't get discouraged, or become impatient. 
>  ------------------------------------
>  
>  After you have submitted your change, be patient and wait.  Reviewers are
> -- 
> 2.34.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
