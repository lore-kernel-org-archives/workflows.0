Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F63FB9F
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709142239; cv=none; b=p2NGFFF7zVJ7vbXdse2hGNBEdKGQZeJ2kffIZwjzfNAf26HwkTC6yQaLL0732kriokb1b4RawsBCNUFKyMDdLF/QHIoSSazjvd6KN6y0qyn6xMHTG5KjWiUHztwsFsvXcUfe9/+xQzI1fI2cqN8p4H9Uu6zlKjRwZeaKZryfN74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709142239; c=relaxed/simple;
	bh=UO/bgn52LLFNF4G2A6M5/7XtLSyA5ZQh2XIZNFWL+zA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ljg2wvHbmzRte20brJ/kErnJaRki1c4O4ktxr/ooeaQX6rl9er+ltUyYOEws1HpqGBFYnw2ulajiZ13mO9st8JTdK7Vbfy6RLNDSwDlo6G02NprqHuiIw5Qp6xaqw1jS5h/XLafls46WnOzC8Q85ITaKYBQeu8SHgJgVHb02kYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dWBmvQMb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dWBmvQMb"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0DABF418BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1709142231; bh=8CldajmWKzl/PqqLLJBTXmNk+OiVJyBY5luAAPoyrEU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dWBmvQMbhRUU7R96njABKbURgNzp2RH2sXJRLe85UeUdO1q2Usw2MkRssT2lx9Mkn
	 bcwyovpXm/R2jH+DyOj0TOcxJnTt37FTI/bsjiNNTUlGoH3SNrS16boChOmbvA/HhX
	 dwc5+TyZHzNnIrCq9PqQS9lktPCiva+uaGBebsryZ2P5Try4EZSOnmNf4uzE5WbB6p
	 kZzxdXVIeimz2xjsgiNpNFSpVogTvWy3PE43+/giGpF3Zf1I6q3iDs1a4AVvrhJYGD
	 2WIOtK0IFiVGs/c/Dvzj6t/WwB/B16tM4l6rVi/aPgl0tZNAfoElInHM9KNhfOTpjg
	 ZIai3nbocjUWA==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0DABF418BA;
	Wed, 28 Feb 2024 17:43:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Hannes Reinecke <hare@suse.de>, Willy Tarreau <w@1wt.eu>, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
In-Reply-To: <4fa1cbc7-0f9d-47bf-8ff7-a9b17456431e@suse.de>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <4fa1cbc7-0f9d-47bf-8ff7-a9b17456431e@suse.de>
Date: Wed, 28 Feb 2024 10:43:50 -0700
Message-ID: <87msrktrft.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hannes Reinecke <hare@suse.de> writes:

> Out of personal interest I really have to chime in here.
> You are aware, though, that following this line of thought
> and improving the underlying model (which really shouldn't
> be too hard given the vast body of training data which is LKML)
> we will actually putting LWN and its editors out of business.
>
> I would be _VERY_ interesting having a discussion here with the
> relevant parties (Hello Jon!) to see which direction we as a
> community will want to go. Maybe Plumbers and/or Kernel Summit in Vienna 
> would be a good place to start.

Trust me, if you're in a business that is in any way associated with
publishing, you're aware of such things.

Whether the kernel community goes in for a tool like this will
ultimately have little effect on LWN's fate - others will certainly pick
this stuff up regardless.  There are, after all, certain other sites out
there reporting on the kernel that have looked like bad LLM output for
years anyway...:)

I worry about some of this stuff in general.  It seems there's a
definite risk of creating a checkpatchGPT that is allowed to push
developers around far more than would be warranted, for example.  But
the tools are out there and getting cheaper; if they are useful I guess
we should use them.

It would be nicer to base them on an open-source (or something close to
it) model, of course.

Meanwhile, in the short term I suspect LWN can find a place for itself.
After that I hope to be retired.

Thanks,

jon
