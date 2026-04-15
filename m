Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AD421CA13
	for <workflows@vger.kernel.org>; Wed, 15 Apr 2026 00:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776213848; cv=none; b=ZzelhyuzBlRmTQhyb+2pEqaHeDCHJC+laXvZ4jX8BKwoxdXIh134ObONlF8DjXOtT29djIYo3ucB27hQg4DxV9mKLd6W8qbhgrCY5Yj4N68sFlKEBi2NUgCP5KIlPpzdW6tGlLfdFVnSjHhsf85aPtAG/68L7djkpea1+PTzxtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776213848; c=relaxed/simple;
	bh=TgwCiFwjdcJDgUrhkIfSlnTeHiGeqnURltQAWPBBqGc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=KlKnLYAJnfg4662Fb0xo1HkbMNm28vcMkw5+KYVLf5FaFdvgdwdxwFEVGk6Y3gXv5u+ahFbu2sh0TmVjfVyCnf/KIU1g/NS27A9TvcKFGY0kreOviDoYPExvYrD/SV5sKSkA9lyU1O2gbT6yN5vdeMyG89lFbQ9khbyp2Bh6pMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U91XEu0V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U91XEu0V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDFFC2BCB3;
	Wed, 15 Apr 2026 00:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776213848;
	bh=TgwCiFwjdcJDgUrhkIfSlnTeHiGeqnURltQAWPBBqGc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=U91XEu0V4rYuoS6NubyXOlcf6vi8vUXU5v8zkAZSdFRDvNwg0C9gD9onVC/OCX1iT
	 1azN0xWW/+wHzWqiOzL1/+w7Mzo3WSZQsYEIOoNoyzBf32VuSIlNJefbjXatlaz5Vy
	 GNKlQ605De94H1Ose/iOrYY+gmrK2qm8TUbfBa5E6Yl5mvMAsE+ju1o01xsTfDhXhc
	 dmRicdnEUUMJdEJCPNG78MsTGGjptQMvua7plGL67+h9QEIdxAXvuJWns4dJ7fMQcs
	 F+dlgprKvPE2+8x70R+L2VpspwNnFUZ5aVGUo1izLgune4CK3bNZu9Z0Gv+H0/2dlh
	 fqdoicELJO42A==
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 39FC5F40068;
	Tue, 14 Apr 2026 20:44:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 14 Apr 2026 20:44:07 -0400
X-ME-Sender: <xms:V9_eaRn3RxztX907Eq-jnSiOf0Y-R-kieHoCNowO2PbHANaNg1URLA>
    <xme:V9_eaW4L_n0WIToso8RKCGSYbeXSBtBIWzSkE28ar7dd7p3yDjYGHjWi3zQdGVluk
    vFMR4thhRDrt93mKH_8p8IiZyRXoVtkbaHmmvsmN-mwRaZX10ezqkDT>
X-ME-Received: <xmr:V9_eaXgNskR-2phr6skaeYK9NJMCgJ0wrOqo2P45ubT7LVJXOuLctd_J1E9ZyN2zcrObUuvMnUpSHwuOcaNvTolq5hBnO9_v0ck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegvdeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpeffrghnucghihhl
    lhhirghmshcuoegujhgsfieskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elhfeiudfgvdeijedtleeltdduueekffejjedvjefhgeevjeefueejledtleetjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegujhgsfidomh
    gvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudejjedvfedtgeehhedqfeeffeel
    gedtgeejqdgujhgsfieppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpd
    hnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghh
    vghhrggsodhhuhgrfigviheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughjsgifse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgt
    phhtthhopehrughunhhlrghpsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplh
    hinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifoh
    hrkhhflhhofihssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:V9_eaTGH8kAb-WMnAEjRwtjUIBhdxQOpOiT_vk-yuu-naWtu6uOKGQ>
    <xmx:V9_eadRTcj_5Id2erUGJBaFlJA-TUzhT33NsvUv5WSao8LUYtqyTQQ>
    <xmx:V9_eaQxHV095ZzPOnr3ebRGAmb8ltISRE7FPGwfsFArwzmYc6lDhTQ>
    <xmx:V9_eaZeWTEG90RiHJ42AmTg-VUSL803nqNyHD7bUOAFli5mxpS1IHg>
    <xmx:V9_eaTPG00J_580yN96TXq9mn2BRvHFZZoVNeeRw0rDcp9Tq1Q3FxcPS>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Apr 2026 20:44:06 -0400 (EDT)
Date: Tue, 14 Apr 2026 17:44:05 -0700
From: Dan Williams <djbw@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Linux Documentation <linux-doc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Kernel Workflows <workflows@vger.kernel.org>
Message-ID: <69dedf55b1b8d_147c8010048@djbw-dev.notmuch>
In-Reply-To: <20260414163204.08f94002@localhost>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
 <87wlyawum7.fsf@trenco.lwn.net>
 <69dd6299440be_147c801005b@djbw-dev.notmuch>
 <20260414143733.6cbd6d62@localhost>
 <20260414163204.08f94002@localhost>
Subject: Re: maintainer profiles
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Mauro Carvalho Chehab wrote:
[..] 
> If you transform this diff into a patch, it would make sense to
> add together with the next version of my RFC ;-)

I am ok if you steal whatever you want from it with a Suggested-by.

The bulk of the important work is your maintainers_include.py changes.
