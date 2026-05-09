Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E6D325706;
	Sat,  9 May 2026 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778308824; cv=none; b=jkVbvnyEV3ia6upwrnaIQcAQwJdKESYcG0rQzDUOWENxKfvt8S0KsLxCq9znhEaWuXMYS2KllwyN/vz2XB26yVkmHRBfBoPetna+sFCxxJRFjfOQ3OME+439al2I/+XHYVGoTebxVlJy9cHeAoVFRO3v5p7JprEPiXJo/d5KMxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778308824; c=relaxed/simple;
	bh=HZE6cx6AgDJ4Gk3meylS1WJTRij4YRp1/5NZaN1Z0G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPIUGslkZ3G60WGN6z4Qq+qFbnDtQPz8He7ywSTRKQDTXzN0Xh1i9QNCuvJIFIUjTTBV797vU4R3cCHiUFnj4mwH2CtuxymVrmAVE1qj5voVom2f2lyY5+8nBXMtwAtva0sM6205QKgRr/+Fd6Lar/IeyFDHiU0qPGIOh3vpIPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Vbk8qSOn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eYmz4fWZ; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Vbk8qSOn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eYmz4fWZ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 73BA97A0104;
	Sat,  9 May 2026 02:40:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 09 May 2026 02:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1778308820; x=1778395220; bh=0L1SGs3VCj
	8ORkcUab/cUMzAb9hXGi6BN9SzuK3T37w=; b=Vbk8qSOnWq03w3Pn6kMlIOgpUM
	Nxag4I+rs1GoNtU6JrKMdMT4ko9ClkBUUabtJ/1qeiCsTcgRWMFGSY9Kqk7GOMjZ
	aczWfV0PVrFigrH9wJk+esetyUuQTDYQfiZjWiBseQTd0nVIyweBV3S/sQF4e3IU
	wHFMeMNRO15o+oj8L0HC26v0CacPat/qBm1vXg+j61XAim7mqHDtdeL0XomV0QJQ
	4LlMu6NeUQqxk9ujNEDjf6DGVpUOC+ZD6fn94ITjDZcY4u7Y5yGQYofYZ29i2LSQ
	nLu7nBtfgHDtYiW55FHT7Gt3mKD6dmY50w7BFHk4MzzgzgM+5E76QIaI6B9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778308820; x=1778395220; bh=0L1SGs3VCj8ORkcUab/cUMzAb9hXGi6BN9S
	zuK3T37w=; b=eYmz4fWZ8aey1oQM3Q4CL7aiDOgBQnarqmQ4FUNhbHYLIJMlm46
	JZjDpML3ousLFqrEXUyLFjgTrjB0azql2IG4PZPZUuaCC8lM5wawYD5nGmVX0ZcM
	TPh0l0IpE5IToyeDT/SUBK7V4ajQ+6HrNVVPHxZVV9MdvTr6+nhDCVuNVlnNG+VD
	VyiGBfVWRZT3MIy6AlFGHc6lc+0WRNVVYgWt/Sxa89zgREFVsstD6TUvhevW/sYG
	iQ0ehtRIAvLdiX1RTQVtkilD+2C/fu5fzayashrWTMt7s/nQE3kLMdFkIy1x7Zrm
	RsHaXQAZV3NPJx9KKgj9HFWG32irQij1hRA==
X-ME-Sender: <xms:09b-aZqzOSYouRpb6E-5c2FIxubRmUp-ZYxPcR0EC9QXAvOHD-SQkg>
    <xme:09b-aTmL3D_wgnKdAZErdD8_GCd_HXRe5_lSV56lH_HFx_skG5WYlX9ZEMq52LzEw
    y7sPxVz43nKajIbWikA-icONGh_us_zY0Q6HDXDyNNwruTh6w>
X-ME-Received: <xmr:09b-adaGLjIhdMp7UHOSnyQQhz2iE69QpacON8V2djZwcyo8gJ6FfIRdaxEEn7a7jsxZqQvy4kmCO_zjY7JOG9wVfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduuddvheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepfiesudifthdrvghupdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigfhhouh
    hnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehsvggtuhhrihhthieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptg
    horhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhkhhgrnheslhhinhhugihfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopeifohhrkhhflhhofihssehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:09b-abUKHyHJELAyTJ6kG2H_-L9ps75z7mCL0aw_6tTVL0J9N7ciRA>
    <xmx:09b-aVB_oYQ9KDt1PESj_2DooWbdAHsEoMH-se3NvfBi2XSVTZ1bCw>
    <xmx:09b-aSxNm3O4IzslDkXobDJtD0R2O_g7byxnA_5eytQ_QkcoA84kWQ>
    <xmx:09b-aTZYZCc-sfh96mmoLJiSXh_wSgx91pJ3CfbIDByW00q8LE7Cpg>
    <xmx:1Nb-aTPKn4oJ9sSbZSUrjd9OuQBQtyrJW_EMX4xy4bVMqLfwrMLNHpC5>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 May 2026 02:40:19 -0400 (EDT)
Date: Sat, 9 May 2026 08:39:37 +0200
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, leon@kernel.org,
	security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <2026050929-hatred-underfoot-a32a@gregkh>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <2026050801-semifinal-expulsion-9af6@gregkh>
 <af4IW_ycR2RpAjhy@1wt.eu>
 <af4RqzO_VHYAqcHf@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af4RqzO_VHYAqcHf@1wt.eu>

On Fri, May 08, 2026 at 06:39:07PM +0200, Willy Tarreau wrote:
> Greg,
> 
> does this addition on top of the current patch address your concerns ?
> 
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst
> @@ -88,6 +88,14 @@ can be easily exploited, representing an imminent threat to many users.  Before
>  reporting, consider whether the issue actually crosses a trust boundary on such
>  a system.
> 
> +**If you resorted to AI assistance to identify a bug, you must treat it as
> +public**. While you may have valid reasons to believe it is not, the security
> +team's experience shows that bugs discovered this way systematically surface
> +simultaneously across multiple researchers, often on the same day. In this
> +case, do not publicly share a reproducer, as this could cause unintended harm;
> +just mention that one is available and maintainers might ask for it privately
> +if they need it.
> +
>  If you are unsure whether an issue qualifies, err on the side of reporting
>  privately: the security team would rather triage a borderline report than miss
>  a real vulnerability.  Reporting ordinary bugs to the security list, however,
> @@ -102,7 +110,7 @@ affected subsystem's maintainers and Cc: the Linux kernel security team.  Do
>  not send it to a public list at this stage, unless you have good reasons to
>  consider the issue as being public or trivial to discover (e.g. result of a
>  widely available automated vulnerability scanning tool that can be repeated by
> -anyone).
> +anyone, or use of AI-based tools).
> 
>  If you're sending a report for issues affecting multiple parts in the kernel,
>  even if they're fairly similar issues, please send individual messages (think
> 
> If so I can resend with it.

Looks good to me, thanks!

greg k-h
