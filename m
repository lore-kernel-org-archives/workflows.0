Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255153F787F;
	Fri,  8 May 2026 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254544; cv=none; b=RWCUt8xQ7n8DVqndN2BuKSav2S2c7n33PGurHVFSFKSDvXjrL6Inp871ezWSLm8rZu7bBHyuH+VKQkbfBIqPWYtRjNv0wbcZJU+UzKmW2yRu5dP0iCnpcxUJK4xeyGcH5u7p+OwciUlphHVWzgXuA3y8JlATPVndDirAGekOHfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254544; c=relaxed/simple;
	bh=qf1BCyZ6W9O8IgXSBeE/ovH2s0vX7jkpx8Hjyt0T/s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hORdG5sCyQ/864TsFiek6Twd8J+lHYU4R2TUjzUq39g5ob2KfSH5NmxMRLzmFHWCDqimPByVFpIvCmMKLURZ6WGQUo3Z5UDsdhe0ivgv9zY0CVbEfdzKXwao2iM0CISkKZjxk6WA+IN+M85q+9/V41fq6ix2f2d52HHscO1F0gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=ap9WNwJt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nKYkjz2y; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="ap9WNwJt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nKYkjz2y"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id AF7D21D00039;
	Fri,  8 May 2026 11:35:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 08 May 2026 11:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1778254541; x=1778340941; bh=x9/Xcnsd1i
	NImBtVxnmMCp8Fw1mdVc0Hm2z2t5zWh/U=; b=ap9WNwJt55KkVYV8oBIQYC7JL9
	VH4PKvQNuj/jormaeiny9qhkZYGTsY3ptumdnxtSv8LxjTM/wEGRH1gNIAOotavr
	b+jWKmGakNssEilap3LlwA3lVKPhK5IedA5nbT0lBU/+tNHGagLFvDaD/WzqdJTZ
	rT7bkWYIRKC4vkzRTfro3GSiGD3fQ1NwslxMrJGm+Va6YcCy6oMy1HCZ/7DJUSTN
	MQpXNMMU9kE1iCQgrTKAs0cXSLwZBwyhfK0s9oueXjB0vgDBNXvFzDo8JKsxqOwe
	38/wJZUB6tdjYJ1aEbfWs/kNn+Djbyi6xBAqKEQsdsMUICG7Xtmg801RpDgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778254541; x=1778340941; bh=x9/Xcnsd1iNImBtVxnmMCp8Fw1mdVc0Hm2z
	2t5zWh/U=; b=nKYkjz2yTwpsNqqQAvLTIJKi8/tG2nmH8+Y9xPhf+jUiYym2/bp
	u0yGO1bgcgVQ5qfeGscb8vuIv7BibmDQfwmsOwJBWt5jM4gkKAcBDuJ6OQDDO3IN
	mpcMwh8kC75ilVelbzFTDhVVFtcbj1ySeQFjsBTBMgNbkPtHOjSK5ljrjAmgGri9
	9UnZ8STsJoBOHg1sCzvW+beNgWMjMctvzrvqwFm3ckF2mRQfN9mrS+rNyC2VczFf
	U2xgBmHQOFwd81wLP/CrsaaTS/sjUMNjz5X2O+S2oa9x8uFIYHn1osZrDPKTa1FV
	mhsvQKTvF6Z4dNve9dHWOLF0+w7qoRCceQg==
X-ME-Sender: <xms:zQL-aVDbZN2MTnXZmeYgo9H_5oLBSsGbzmvTvo9MDtv3gM0aLIbnjA>
    <xme:zQL-aaFKYYTVtaUfx5_qOoFXrEln4Hn3X3Ztk-LJzSMEtOMjC8P6LngPS3iH06Hs5
    _TEEjKtpoVrI78lUbWiRLRfQZD4SDh8jgNozCwauOm7iXdc>
X-ME-Received: <xmr:zQL-aSTKyEUckhDE7FWlsruaJ3XnUE_qKGDm7vZG4sCKetk7OQzkISoASsdg5Ez5BE3fblQ3rJDrq1DLoHm819IKtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduuddtjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepthhorhhvrghlughssehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpth
    htohepfiesudifthdrvghupdhrtghpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehsvggtuhhrihhthieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptg
    horhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhkhhgrnheslhhinhhugihfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopeifohhrkhhflhhofihssehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zQL-aZO7OV-mIV0SYWncZhLZGw9NoB2CHBDQFqcG4ZkBk1W_inC_zQ>
    <xmx:zQL-abMnVfQ3oP4OA0F1NZ-F4RJhpmnM6UUawI-LYpdtzM2OpUQHuA>
    <xmx:zQL-abGtT3cgReOAsX24O-WHSfVTZju0DP8RdhKnihuNV0I933Brtg>
    <xmx:zQL-adPR93ybLTYRyi48YWZNuZX4Fkx-ryBMqjRy5gE0jeZBBmqrOg>
    <xmx:zQL-aeLdVz-vcOKrGIEV5Fn4NRWWl_qiogFLjbTSNTb3bl3ocWlIidXl>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 May 2026 11:35:40 -0400 (EDT)
Date: Fri, 8 May 2026 17:35:39 +0200
From: Greg KH <greg@kroah.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Willy Tarreau <w@1wt.eu>, leon@kernel.org, security@kernel.org,
	Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <2026050801-semifinal-expulsion-9af6@gregkh>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>

On Wed, May 06, 2026 at 08:46:07AM -0700, Linus Torvalds wrote:
> [ Coming back to this after a week of trying to clean up the disaster
> that is my inbox after the merge window ]
> 
> On Sun, 3 May 2026 at 04:35, Willy Tarreau <w@1wt.eu> wrote:
> >
> > The use of automated tools to find bugs in random locations of the kernel
> > induces a raise of security reports even if most of them should just be
> > reported as regular bugs. This patch is an attempt at drawing a line
> > between what qualifies as a security bug and what does not, hoping to
> > improve the situation and ease decision on the reporter's side.
> 
> I actually think we may want to go further than this.
> 
> I think we should simply make it a rule that "a 'security' bug that is
> found by AI is public".
> 
> Now, I may be influenced by that "my inbox is a disaster during the
> merge window" thing, but I do think this is pretty fundamental: if
> somebody finds a bug with more or less standard AI tools (ie we're not
> talking magical special hardware and nation-state level efforts), then
> that bug pretty much by definition IS NOT SECRET.

After the past 2 weeks, and the past 2 months, I am going to violently
agree with you here.  We've seen so many "duplicate" bug reports it's
not funny.  All of the modern LLMs are feeding the output back into the
model for future runs, which makes the data totally public.  Even if
not, the output is being monitored by external companies at the very
least.

> So why should be consider it special and have it be on the security list?

I don't think we should anymore.

Yes, having a full reproducer in public is not good, but the general
"this is a bug" comments we should start redirecting to public lists
more.  That's the only way we are going to handle this influx as our
"normal" bug workflow works very well, especially when it comes with a
fix, as these LLM tools can provide very easily.

So if this could be reworded somehow to reflect that, maybe?

But the "what is and is not a security bug" is a good thing overall.  We
need a solid definition of our threat model if for no other reason to
keep me from having to write over and over "Once a driver is bound to
the kernel, we trust the hardware"...

thanks,

greg k-h
