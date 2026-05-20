Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D015234250D
	for <workflows@vger.kernel.org>; Wed, 20 May 2026 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260836; cv=none; b=eYj+7xHCa8LFfaquJCxzg+sv8EImm62PU9faVZxKaz8htfqb66kiC/BoW4kAo0S3jLbafz71AeMULq+yXhDHMnTonlkpbDxXjgVUaSYt8W9noGsqPNhc/9gBrommzTURgFREbe2R6Z8qDf6xrwgaKQotoaAMylLd9/zYnJRjv7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260836; c=relaxed/simple;
	bh=4UmG7P11W8AQAGwVtiZgMyYozzVFcf+K+iTyto2DY7Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jAyn3lSBeWlvoOr1F/JOGVGg+S5FnzzTpJhg5Twnl8r1Dma69/GnZUnsM03oA0cn2mxah/UkTpmNmjxfL0P6FFtJ8aBHRF826+y18DY/VFGZKcQdjRrfw+rUDlwiizQGKlxcj5yhCSrIXG8kWC674Gj23Bv+01pR9u/M0oyniVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YRediu36; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mSQazrMl; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="YRediu36";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mSQazrMl"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 19378EC019D
	for <workflows@vger.kernel.org>; Wed, 20 May 2026 03:07:14 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 20 May 2026 03:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779260834;
	 x=1779347234; bh=Yc0JG1Xn3Wha37rB1V4lbZPt4g1XIowSANBWVbYnYYg=; b=
	YRediu36CFY1XfFXRmnFcnBXOCUui57MlUAbeHOS5ty7DLP2s0UVD/TtasvwWCMz
	nBfHyqNDboWdMKavQVFsbj/yW6emKLzIXx1tktFP3sfKqE6upIDCP+GkpsGBJ47T
	l8Q2oDy0pd2CKF2dPEWMU21jny1vhKCqIB0Y9OzSrndcODxABIaJoUkTw0kV3LoD
	QT5444l5/DXwYmRo75nvzkk7H85ESTDuFs5zqrmk0jY2MOlWgFCHsare8jefSCh/
	1sxI6gNudDEhFMN+dysInXLL7q9OMq+WnzB+CJmkrJMmK2C4wXxZ4xyBmEEzei1r
	m7vjlK+6g6GdiriHdaMMwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779260834; x=
	1779347234; bh=Yc0JG1Xn3Wha37rB1V4lbZPt4g1XIowSANBWVbYnYYg=; b=m
	SQazrMl2ZIek9gG+/bQi3A7mY7eDxcSgujgyw/cJA4KfayVNpUPuBjbm11571toV
	3ApstvzqGMJEEeya/r21XQS/WWi1GXUKiELM0NzYDiiDjIVS9wEiuejgu3JDYUXj
	QG7GbpjZFscH9zYVsSO8SYdLwru5c0T036eTGe2IF6WF/GPPGkoEB+Cev8+IYPt8
	uBA+7dssK6QCCh+DYGHwEQQcCdq3fBZ7yYpHOrFsM7amGOONrn0bioTrxZRdN9W5
	pmz9qhvbVMDsvyM3iFk8QNsed2etjgeo06KqdcTlPz9+rXZ+a/HGm+Vb26ixPnc5
	1fau3tM5l6aFn9D36Ft2Q==
X-ME-Sender: <xms:oV0NaoC_NUfg9uiIgw7WKm83iPZ-POoA9NLZZsRurhfJbaJc1M34fw>
    <xme:oV0NalVdfgE6FoOS_0ozytH39XRjVKMStHZG26wF03CZ-Gi7yPthdzajoFJoAXmV0
    2FQKvvmDgbbxjcRJf6lY0OR1mhaCxAQ6TRH4bLASSKKEL-C5X2GX423>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeefleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkedvheeghfehlefhvdehfffggfdukeekkeehleeuvdeijeeuteevgeejvdefueet
    necuffhomhgrihhnpedujedrrghsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfihorhhkfhhlohifshesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:oV0NalScQrE1s8J1Md738-Qb9yzfGQWM2IZTMNyBuLFoqBFVbzZnYA>
    <xmx:ol0NauuIta-6A16aRp-fX0wsPPVUpYxXt0leI1MwCeZvjgf9v_nwdw>
    <xmx:ol0NantjF43WD8T4ElZBkc8rmXpm3sGH79lZHHEKbhXlp4tvV2It2A>
    <xmx:ol0NakzKZDe7ohKszJ-tz1s_XSvql_1ll6xSICOa1My4KJddzKhqCQ>
    <xmx:ol0Nannbv9s2HYEmVU_9BqW5sreNp3OF42duFY7D1wUYrHV-FxMGcCqz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DE0EA182007A; Wed, 20 May 2026 03:07:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AoFiOxpvQUXV
Date: Wed, 20 May 2026 09:06:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>,
 "Dinh Nguyen" <dinguyen@kernel.org>, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, workflows@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, linux-pci@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Alex Shi" <alexs@kernel.org>,
 "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" <dzm91@hust.edu.cn>,
 "Hu Haowen" <2023002089@link.tyut.edu.cn>, "Kees Cook" <kees@kernel.org>,
 "Oleg Nesterov" <oleg@redhat.com>, "Will Deacon" <will@kernel.org>,
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Frank Li" <Frank.Li@kernel.org>, "Dave Penkler" <dpenkler@gmail.com>,
 "Andi Shyti" <andi.shyti@kernel.org>,
 "Jonathan Cameron" <jic23@kernel.org>,
 "David Lechner" <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Andreas Oetken" <andreas.oetken@siemens-energy.com>
Message-Id: <76af64fa-7820-4d92-8aa9-826c3bd812a1@app.fastmail.com>
In-Reply-To: <20260519103012.blot4bssgiqfer6p@dev-vm-schuster>
References: <20260518042833.272221-1-enelsonmoore@gmail.com>
 <d40b1e80-37fc-4c88-9d7f-dae6458efe6c@app.fastmail.com>
 <20260518105735.GW3126523@noisy.programming.kicks-ass.net>
 <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster>
 <CADkSEUjhq6HSdg4ignzbuJiN5uXATsTdxFbRJ3BMxs5=WUWLDg@mail.gmail.com>
 <20260519103012.blot4bssgiqfer6p@dev-vm-schuster>
Subject: Re: [PATCH] nios2: remove the architecture
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 19, 2026, at 12:30, Simon Schuster wrote:
> On Mon, May 18, 2026 at 05:13:58PM -0700, Ethan Nelson-Moore wrote:
>
> 2035 is still a rather tight timeframe for our typical support/phase-out
> period (we would hope to get close to 2040 with the SLTS extensions),
> which is also the reason for our targeted 'lifetime extension' for the
> nios2 architecture for approximately 5 years, or more precisely ~2-3
> SLTS kernels assuming the usual cadence of 2 years between SLTS versions
> (+ some safety margin).

I think that is a reasonable target. We have a bunch of embedded
architectures that have a similarly small user base and I expect
that we will want to remove most of them at some point, as we did
for seven architectures in linux-4.17.

As long as there is a maintainer for nios2 and it's not actively
getting in the way of a specific treewide change, I don't see any
reason to remove this any earlier than the other ones.

Obviously at some point nios2 will have to get removed because
of the limit to gcc-14 or older, but that should not be a problem
for the next few LTS releases.

> Sure, I'd be glad to do so, but so far I refrained from it as I was a bit
> unsure about the netiquette (can I simply do so by self-proclamation? At
> least the git history seems to suggest so...).

Dinh already replied that he welcomes the help, and I also suggested
the same thing a year ago. As the only known user that has contributed
patches in a long time, you are obviously qualified.

Sending a patch for the MAINTAINERS file to Dinh is the first step,
once he has sent that upstream, you can (optionally) apply for
kernel.org account that would let you host a git tree on kernel.org
or have a tree that you both have access to.

     Arnd
