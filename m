Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7CB3D4127;
	Tue, 12 May 2026 05:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778564857; cv=none; b=RK/dz2QAogvGNUG+vpOLnGJYjLEomK70axnn8fidLk6ueCKECrzjrrDcLJNkJuzEidZgnf1n0EtO0EzZqwdl1KJOmEgxWRKBfBSozlMR7q0M8v3tHm6Caf7qB9FOzfzOtfY3D8QGnTVOj1b0oi+fqDEtaBuFHILggGkkV2Zw408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778564857; c=relaxed/simple;
	bh=mH6HamasgfNH5+Oun9m28ITvcUpH6vu5tQYINbd/daA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRJGrStVGmU+pax9rT0hagT3alGSEtVjdAQEntGX9LUniLlahuh80QuM2vy0qOGIXYjLbP+gLt9WNqGT7memuzkcq9nq4ktG5PMW95VeEkwuV5OfsY2S72MHSssj28EDGx7BqdWuW+k8Rvel6jag5ZPhFu/SYC2ZZXsvtdaVw2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=JFM6h89j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uqeDpROm; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="JFM6h89j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uqeDpROm"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 4CACE1D00098;
	Tue, 12 May 2026 01:47:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 12 May 2026 01:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1778564838; x=1778651238; bh=k0CMgzAxgy
	Ii/51D/cd/p6s4VOP0mBKlppFO00Y7Kn0=; b=JFM6h89jl9m1TF/F20Kt4WwHp1
	JTqbapWtWlDGyxOT6P186QqlDXeHkRTpDqBKhBN4M6orLefDRKlKcQqtzrJhNdw4
	+VhqHYUdrInvgVnIE/KxFULzX8K607UJ74KUB1ngn/0oZdcDgraldkEBlNpImVST
	TOoYaMxKHjiyIo34SY4eldUpQC76w8T76iAlgNGQuB9y0/NM6IodWlesH0uULBdp
	ZfCcoMZHwTPN7h3+2bPCOg4MT9bZ69VTaPfJk0xpS1eXbsAqKOBth/Q0vJ3xGw98
	Qit1jnzLvS11Aw2Vl1eenmQ67Y7kNXTaF6hme5I6ZhwjfuNRexNxxuOa8y8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778564838; x=1778651238; bh=k0CMgzAxgyIi/51D/cd/p6s4VOP0mBKlppF
	O00Y7Kn0=; b=uqeDpROmpK6+4lfQaxL3AQWhAEqiCLz2s3lHr19dQqLhB2FCFa/
	8jCfguM1Hv7Gf5fp9ZStaN2zxqK3orIQusTR/srxM97J4uCSkgGDUdkWh+oh5KtN
	aCB6fNxp8x/8d4kUFawwV14PgVDvc07MlcgkMdxpqbAi+g8yIF7ARWN+cSR5trGE
	o+ecnP7APm8RnVy3T81C+q5KyoUUO5nayBCsWYeWmrjIQKzU+uu9yb8t0bvOJNxI
	LlsIPtO5xJYvUIqXH+6THwaBKKiTSTUt/6tjmaBFN4nX4wuzjdRAdcKaQLF+zgPl
	h5mxSdZYz4i+1pkxpE7AvxIFQ2fH+xoD/gw==
X-ME-Sender: <xms:5b4CarD_PNMdSmCpoXCoU4zNw8ZMMfQh5-Cv8KJquwH67eOPvuWG7A>
    <xme:5b4Caid8KVHKswEqXU3_YtvidkAJP6Q55G4rqDycR3YutnUXN4OTdwXrsSwtaBBLY
    Az810YDxFKUbKfn9MagrRjw03r01LUC37nQSOnGNkiBMw0gpA>
X-ME-Received: <xmr:5b4Cam7s1fjQlwv7HIIc2slljOBgosfjensoE92dWrR9EV1iEliC0YttMgfeGG1VhOvhWVNOXEVCEoJtd88OGSHiIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvddutdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepfiesudifthdrvghupdhrtg
    hpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehskhhhrghnsehl
    ihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepshgvtghurhhithihse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifohhrkhhflhhofihssehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:5b4CasNIaix0gafF84nhTsyYpTJAq--epJM4WA7V32YCXi6XQyWo-w>
    <xmx:5b4CanHPWU64h1TeWBGjz2bD7qWcxzxpTAg78wi1YL7YS7CEW0yMEw>
    <xmx:5b4CagSYDZALmie5qoTImXAbR-t2qTpHpfiOqFsrTovnxHKv9PCVCw>
    <xmx:5b4CavTt7uoi2mM46H49eF2KoGRKscMabQEZsA9SxizJgnLVFceKqw>
    <xmx:5r4CasUIVGK2vQjmT1uM7S2XNEgOfLM8mjHopGNlVUJRIazU6cHIydjd>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 May 2026 01:47:17 -0400 (EDT)
Date: Tue, 12 May 2026 07:46:34 +0200
From: Greg KH <greg@kroah.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Willy Tarreau <w@1wt.eu>, Leon Romanovsky <leon@kernel.org>,
	skhan@linuxfoundation.org, security@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <2026051220-fetal-obituary-bb2b@gregkh>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu>
 <2026051124-afar-renewal-795c@gregkh>
 <agIZ8zeg3m0xE3yL@1wt.eu>
 <878q9pvlif.fsf@trenco.lwn.net>
 <agI7XogSmfN_Pm4t@1wt.eu>
 <87a4u5u195.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4u5u195.fsf@trenco.lwn.net>

On Mon, May 11, 2026 at 02:42:14PM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> >> I can ship stuff Linusward quickly too... :)  But it's fine if Greg
> >> takes it, of course.
> >
> > Oh that's fine then. I thought you only delivered such updates into next
> > releases. I'm fine with either way of course! Let's pick the path of
> > least effort for each.
> 
> That's my normal procedure, since there are few docs changes that have
> greater urgency, but I do have a "fixes" branch.
> 
> Greg, what's your preference?  Unless I hear otherwise, I guess I'll
> apply it shortly.

Please apply it and take it through your tree, thanks!

greg k-h
