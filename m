Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4F7DF76;
	Mon, 24 Aug 2026 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589995; cv=none; b=pkFYWGMCVpAAHd86n9fHfMNIzL4amogBG3b2VLLrBAC4O8MHe0+rRaX9akldNA90DjG4BsGdrPu5F3ZuF5E1YdJc9ac3ptG1Yntb//w0BoMCBwSYbp3NdkMEHtDXrDGheKsRjbYx02Sms3fxMV47keKjN73Sm+7nb9vXxCEVDmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589995; c=relaxed/simple;
	bh=0j6enbSa/iOYzZVaFS991N/5wFduNv2P7B+4iTZDi54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gh2ANohPBCt9jFPQuuv51mtlQsJQKS7HWiHNPbyEnR+TS9OPharp5/3Cn9ZsCE2qWPEy2U/IDTwuWnP0B1PejkSnoi4/Z/oJsgTm6nfLw3vRI07Ri3RTaB5EBHxN/RHSYCAV2stP8kWZzazX8h2kMq0KSdHTIalb69DaTHtQrhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=D9QpKNG9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="D9QpKNG9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LbSUqeyoNlKdvh0/9E/r5iDG/b05kEEhXVw9S4DWR20=; b=D9QpKNG97LkrqhsBQ+HjdOzlCO
	SctfWmdpRBfWXPin0DJvxGc8YT1BR9sOfJA5U1bT0O9TPWfDwTPCkYAawDhe3XU2cBEMdVJuo6mEg
	OZ38bYPrOHOihrGXVAZB5Ee2NfIhZrUpllTGJl330on7MAVI8Hfnk+QW6oEbNldZkMuee6Xr1Kzn5
	VE8lN/iwvaIr01pelkT4Vr+wTFQHScJq/nXz0tR2bNfPT958+Oas9Qp+Qx0zheBzpsVivO0UY9Q7Q
	SNQCRyCo/QxcOh7qKmkOHgSqa771j+9k6rqsWUki6VC/q+sqJdBwixXkp2/7dkokWgkO6QBp0U8fD
	wX5mjp/w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXoY-0000000H4dt-31TY;
	Mon, 24 Aug 2026 16:46:26 +0000
Message-ID: <98f56a3d-ad14-4ee3-9c36-3eb4b758e6f9@infradead.org>
Date: Mon, 24 Aug 2026 09:46:25 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation: process: Capitalize Git, Quilt, and
 Mercurial consistently
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260824133826.13934-1-ducthinh100812@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260824133826.13934-1-ducthinh100812@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/24/26 6:38 AM, Nguyen Duc Thinh wrote:
> Update various process documentation files to properly capitalize "Git",
> "Quilt", and "Mercurial" as proper nouns when referring to the source
> management tools themselves.
> 
> Instances explicitly referring to literal command-line invocations
> (such as "git log" or "git bisect") have been left lowercase.
> 
> Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> v3:
>   - Fixed the un-staged git commit state; the 'git switch' changes are now officially gone from the diff.
>   - Disclosure regarding tools: I DID NOT USE ANY KIND OF AI AS AN ASSISTANT IN THIS CONTRIBUTION, the mistake occured because I don't frequently use Git to send patches, I use it to open pull requests so sometimes it feels unfamiliar to migrate.

"occurred", but it's not part of the commit message, so don't
bother correcting it.

>   - Is there any mistakes that I'm still having in this patch because everyone make mistakes.
> 
>  Documentation/process/1.Intro.rst             |  2 +-
>  Documentation/process/2.Process.rst           | 18 ++++-----
>  Documentation/process/3.Early-stage.rst       |  2 +-
>  Documentation/process/5.Posting.rst           | 10 ++---
>  Documentation/process/7.AdvancedTopics.rst    | 36 +++++++++---------
>  Documentation/process/backporting.rst         | 18 ++++-----
>  .../process/embargoed-hardware-issues.rst     |  2 +-
>  .../process/maintainer-pgp-guide.rst          | 38 +++++++++----------
>  8 files changed, 63 insertions(+), 63 deletions(-)

thanks.
-- 
~Randy
