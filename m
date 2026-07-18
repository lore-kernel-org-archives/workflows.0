Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2F4846F;
	Sat, 18 Jul 2026 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784386255; cv=none; b=ijsa+1BSZ4lFUHC7GtXltVjvm3hGCByhvZBuSZ2eStutk9TiPtMEQMgd4mKxja1ZJRrCGCPzY29S9UqjLBRfFv6rHYVjlW2LzhxlthW6fW8bzjFde/56A5rSCzXrXJDji7SiQk5Y6p4yC3SkozlakjPpxYbXvXffNoqtsrzV7co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784386255; c=relaxed/simple;
	bh=rIZspjrdGUwIPmk5jXqi5RFOWXte/BVGK11VgPQ4z9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9xLMsAuYzLtuWCZG50q+a10K/tD3c65E4HCPyDROqVdrN/gD7otBbGKsQ3s9sPphEr8pcPfIUWs08jb3JcJeasG/llhsIhWJYONS9qU2bDsvzy3yewSuq/RJdk1s0UdZEAEL+z+/9Pg7Lxhg5GUqL2COj7ZjN8lC2PiQuCnTJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=g35Uxnnm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HElgD9/o; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="g35Uxnnm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HElgD9/o"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 853C11D00066;
	Sat, 18 Jul 2026 10:50:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 18 Jul 2026 10:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1784386251; x=1784472651; bh=fgfP1W69JZ
	p3ze+SK41sRut9n47h5qPqEIik252Z9cY=; b=g35UxnnmU90R1zIX3XPlyk02cz
	cCptP/4OvPHDLsNPJGVaEc9vBL/sZaOyOjZ8piGhbMFdT9NJgVscVWO750qsIi7o
	HFEz1ZNAv7HKI9aZJSL/kSamvT3lq361WGqMM7WZSPtnMNo/bYZRHaY/piJoyKvN
	R0dCIBr4rKgxJCif10UlILBXHsUX7hcYeAXYLkeaiXduXf0yf7/1K7nCKdoo7Yi6
	aM95+psGvAFRN3as5/BPLTT5l39HbvKr6hhBMt6QKTshdNiV1eD5fAWd5IzjE6RH
	OrmFuUXE3sBMdFTxua2TajXTo2iiY6JTt9lYStLwCqMUs5bxrY2NogDzw+YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784386251; x=1784472651; bh=fgfP1W69JZp3ze+SK41sRut9n47h5qPqEIi
	k252Z9cY=; b=HElgD9/ogJLatvq7pDTRqIuZBHuNpaMuIw26PHl36I9bM7wInGL
	GDJRXcSQ77+al84KGF7Qt8eC22nfIviaxM4X38MS6mntV9s+HgwwP8NHvx9CEobd
	smGJRbnSbSwiyO/28fNBRoXGcWFkz6Uh3DyAEXitc7suWKDXsvL8n7OdY/AFtUMI
	oTMfv8rsdXoDCYxsNpyN24O31rtR43tgC3T4JtimP7AFWEKt+4XPprc72BcCB8PJ
	eym34Kb9yKaN1IG5yFvv9Xxm91GRbuqBiqmCaMskIrQUbFLaRKkdSpMli3gWWHJB
	BydKiV5ZvJ63hezQjzRI84S1kGVRT5xQ+Bg==
X-ME-Sender: <xms:ypJbamfQzENWedX8wxv-5-c1nbvBzgckKrXqwq2qXVsxWvggN9BHXQ>
    <xme:ypJbavd9G3cqNlStQcuMm_8WUUKAMy90X5-qGGtoDhaTRKqT6W1H8ondq_sutXcEK
    Zv-m1jYId91G3mNg9LHRUMmSVkrgFzlQaZAlyuSXEoAKfIpQA>
X-ME-Received: <xmr:ypJbaqWA89UjBkjJpSB0c80F5sf8jv7IBoEJBCwqLxH1zSr2zkqfCIaLgtJzPvalzRy_M0MGHDjtVGBUue7vUKp7Qg>
X-ME-Proxy-Cause: dmFkZTENA/KYajfaygZXiRKHjqwikDZb5S9IqhORgoab4m85ITJ0zsqvjoQPNUlwtof9MR
    Cfl+vKmXgrkrF3B/XCauNOok89FadFQ94U7fbzsmBQ+AeqM+qOLZND3JluZft/nTSUS5Lf
    C7mpNySzgCzVAi0oZkYRGMJuzw5YkypVx/l88+e9fXYlVVWgJrhms9p8YiBJOBNPtYIseT
    jwKWKfOHFrjl2Lj5HtD9lCToEYdoexLWLv8kKik9qwT5Nosbz/QP0NZ2fKbWYzMdAHqAH6
    7Ac9o/pU76kl6YrvJHrDi61h1fmH2A2OhEw0pBY9m04VZ3cF9MZCQ/WbNF7Bb7aA2Xzbi7
    tHPewR1a2eTUZa/B2ruW75QmwuZLeG4Ob5k/T/9tinFXfeTqJoFXNje4nG1TCWuqU0Vho+
    8/gelGIeyOLNp5sLZfHpr3y9CZOyP2MbnDlpAtZJ4EJAXblpJmB30rfvt7eaNUYt/scLIf
    rGkla1mK+xd95yEvkUs/Lb3s3A4yyrH4rCFiTGy7cJo9un6xClQwGye0CUOZjvgX7WeGcE
    2sHvUKiQp9Ob7AwCbAIbHspits2yh0+adxn19UgWANPOOVUJISK1GLqdZtwLvs85MnvQKx
    Uf/m0E/vBE12lHmC67HcB8iZJmv5nfH6J5KDb/MCmXd72Fpm1VSNhyr77JfA
X-ME-Proxy: <xmx:ypJbarfbLwkAE22ABoEyd6_q-3qykgsDiqFZC9xtmX8mxKtYIjNArg>
    <xmx:ypJbam8_x1qesba86txAy43lJ52F5-QG9xNa3m9sbg7WAwjCIY6Uyw>
    <xmx:ypJbaikLK0KWswc232vHXEm69bNWztkiGhCGl-vurJDpokkr9S5ZjA>
    <xmx:ypJbanh9OrmgX9z9pX2BgAmFwRzSVx1AfM6f0IM2cvXXwS69MegaxA>
    <xmx:y5JbaoASPHj5Tz4O7LnjW5noFsJNB22nVjkaLFmqZCMqMJp-dOn1aP9O>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Jul 2026 10:50:50 -0400 (EDT)
Date: Sat, 18 Jul 2026 16:50:43 +0200
From: Greg KH <greg@kroah.com>
To: Yahya Toubali <yahya@yahyatoubali.me>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
	"open list:SOUND" <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 5/5] Documentation: add SPDX license identifiers to RST
 files
Message-ID: <2026071820-curvature-oversight-118b@gregkh>
References: <20260718144005.1880568-1-yahya@yahyatoubali.me>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718144005.1880568-1-yahya@yahyatoubali.me>

On Sat, Jul 18, 2026 at 03:40:04PM +0100, Yahya Toubali wrote:
> Add SPDX-License-Identifier: GPL-2.0 to documentation files that were missing it.
> ---
>  Documentation/core-api/memory-allocation.rst | 1 +
>  Documentation/doc-guide/sphinx.rst           | 1 +
>  Documentation/process/5.Posting.rst          | 1 +
>  Documentation/process/howto.rst              | 1 +
>  Documentation/sound/designs/index.rst        | 2 ++
>  5 files changed, 6 insertions(+)


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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
