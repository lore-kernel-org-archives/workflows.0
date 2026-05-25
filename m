Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DE3395AF8;
	Mon, 25 May 2026 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740794; cv=none; b=nJz95ccOcJbXGq1bKy3K8lzdeIanDGqo5VBTjB6IWP0UKWmMmG0dq8ksWD4lUKtop2JZRPLIJfRtYQCcp0Rp3fpEzwfRUCMC2IW23NeaqDA/QWwrPI17a0AkOwZVIOozA1uN2cFJcOjam4lLgQraJZPkY1zwIFdCq/HhR86nSq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740794; c=relaxed/simple;
	bh=7l8G++t+z7KKNpGTbJbjuQ6M5TfydtdjBkXZi+wzCsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfRnu/WPSqISc3WThXTE7FsvmFwf9N9RbnbQtERM7v57YYQcvYWelCEfFnIQhdwh0CZ8uTpTYwUlXykCv+I5a9jKRWa19fIhO3ZHyKh53A95CXhylTyL+LF8O1fbMNaL0+ViEI1WKYyvTdFe21IjA4apEfDfzzqDCEh/G+8LdCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=XHuCB6yH; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="XHuCB6yH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1779740782; bh=QzCOsg0k3subfWBjx4VK1ddwpG8rJvwMmG7rOrpNlv4=;
	h=From:Message-ID:From;
	b=XHuCB6yHXa4Zkqyd5pwXMScd4O7FapMdOPIIPYj42ogZfc6115XObsU2EqW0cXOJl
	 n8V2i0K0CbmDNeTmcHPmISFM7R3BrmcyJr0hLgELnTZBqxVABz2ulKg5aiSIYiUMlC
	 eDPUAowJmA9ZsYWp9JXUiG6n8Wpj5OQPxO4pCVg0=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 76AD5C095F;
	Mon, 25 May 2026 22:26:22 +0200 (CEST)
Date: Mon, 25 May 2026 22:26:22 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Baruch Siach <baruch@tkos.co.il>, Shuah Khan <skhan@linuxfoundation.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: threat-model: add missing closing parenthesis
Message-ID: <ahSwbqsKW628y63H@1wt.eu>
References: <da8ee1e8b4e99261ec11544c4e1a4f81316ae965.1779032501.git.baruch@tkos.co.il>
 <agnm9A9SFsmvIFZg@1wt.eu>
 <878q971but.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878q971but.fsf@trenco.lwn.net>

On Mon, May 25, 2026 at 02:19:06PM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > On Sun, May 17, 2026 at 06:41:41PM +0300, Baruch Siach wrote:
> >> Fixes: a03ef333fbd6 ("Documentation: security-bugs: explain what is and is not a security bug")
> >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >
> > Thank you, and sorry for this mistake!
> >
> > Obviously: Acked-by: Willy Tarreau <w@1wt.eu>
> 
> Amusingly, b4 turned that line into:
> 
>   Obviously: Willy Tarreau <w@1wt.eu>

Ah funny I didn't think about it! Re-reading it with this in mind makes
my reponse a bit surprising.

> I was tempted to leave it that way, but decided to fix it up :)
> 
> Applied, thanks,

Thank you ;-)
willy
