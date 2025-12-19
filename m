Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B322E8B8F;
	Fri, 19 Dec 2025 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766151443; cv=none; b=cNQQHv1FApAhItKDm/zjytzwQTq3rjfkTZ29LbMN451okhdBVqk0uwSv8BMdMT+wRCBGa7D1Q2yw0LEf7+Te3rZoxAPzMObecOAwtDZ2hrAzBzIzFmMph+xPpRzuTEsf3EXHrSFDA8bfka3zTD2UI6CDDZ4ErvVPrp8goJ7Use0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766151443; c=relaxed/simple;
	bh=6VSjTRmLgtkVc66uO43A5O57rvUd3WQd6zTBp7lVUgw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=cX/glZoqs/wlQ3RYhUSdPkAYV8Yov4TD5l9CqUvbVjdJHdcz1j57BWYj1Z86fToCvD/0OSwtvJn4eSpeLn8826RTVWAI6iQSJEUwx5Ap5AV7DicZw64k53MfLi9m/9v9abT6IQEe9DfqAz9E+qjIt/SL+tgzU0dANEIMfO78sIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=ZuBTXlsC; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="ZuBTXlsC"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D08681FD30;
	Fri, 19 Dec 2025 13:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1766151433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gKCHNYhc0/N1YXDpwqYXfu1NcFHLGbirjmRWeMXHPik=;
	b=ZuBTXlsC8/cxX580FCp7bKaMcdhG2Kg4uBdKIsM1/P47/DBcWq0aum6zRIckMoIlgBq8dP
	1YX3w76D6DMWe2BUnet7RrB8FynVEaf0qMj3YHrbzNC4n/oTYqjkp4A5TPhRnDupcn7bYY
	T+8bxVxF1dHk4ToKpuG22/D9Tc9WRaygP0vLxsKYGKLKBQ9IGNxMT4EfVpZnYFkQ79yyWM
	+rc+kUTqx8CPtSaIUfVeaFYVKDOTxKhad628DFk3u1qKzHmzY+uZETvvHwaAEO3FFYH0CY
	aLSau+fFRZef9ANfCHzI8YX6M7dz4DkkVdHtA11vzcki7fEilTrxye2Ul9HLsw==
Message-ID: <cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io>
Date: Fri, 19 Dec 2025 14:37:11 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Guillaume Tucker <gtucker@gtucker.io>
Subject: Hosting first-party kernel.org container images
To: Arnd Bergmann <arnd@arndb.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 workflows@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 Ben Copeland <ben.copeland@linaro.org>
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegkeegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepteelueekuddvteeileeuvedvvedvhfffudefvdelvdetudfgfeehgedvueffffeinecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpkhgvrhhnvghlrdhorhhgpdhgthhutghkvghrrdhiohenucfkphepvdgrtddumegtsgdttdemkegviegtmegruddtudemudeirggtmeeivdguudemleektdegmeejrgekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggstddtmeekvgeitgemrgdutddumeduiegrtgemiedvugdumeelkedtgeemjegrkeefpdhhvghloheplgfkrfggieemvdgrtddumegtsgdttdemkegviegtmegruddtudemudeirggtmeeivdguudemleektdegmeejrgekfegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupefftdekieekudfhffeftddpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeelpdhrtghpthhto
 heprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehkohhnshhtrghnthhinheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg

Hi Konstantin, Arnd et al,

This is a follow-up from the series about adding a scripts/container
tool [1] to run kernel builds in containers.  As per the discussion
at Plumbers last year and the summary I put in a blog post [2], it
would be great to have container images with kernel.org toolchains
hosted upstream.  This can mean several things, so let's break it
down into a set of potential options to choose from:


* Containerfiles Git repository

There is currently a PoC repository on GitLab with a Makefile and a
number of Containerfiles to build a set of images:

     https://gitlab.com/gtucker/korg-containers

It can be improved in many ways since this is an early PoC.  The key
decision to make here, if we do want to have container images
supported upstream, is how to manage these files or a derived
implementation.

One option is to add it to the kernel tree itself under e.g.
tools/container.

Another option is to add a separate repository on git.kernel.org,
which I believe would be a better approach as there aren't any direct
dependencies on the kernel tree itself.

A third option might be to keep it alongside any recipes used to
produce the existing kernel.org toolchain tarballs although I'm not
entirely sure how that's managed - something for Arnd to judge I
guess.

A last option would be to keep it on GitLab or move it to GitHub
which would provide some CI/CD tools for building the images but I
doubt this is something viable for the kernel community as it would
create some vendor lock-in.


* Container image registry

This is where things get a bit more complicated.  As far as I'm
aware, there aren't any container registries hosted in the kernel.org
infrastructure at the moment.  A classic option would be to push the
images to an established one e.g. Docker Hub (docker.io) or the
Google Artifact Registry.  GitLab and GitHub also provide theirs of
course.  I believe there is still a free plan for community projects
to host images on docker.io and that would be the easiest from a user
point of view e.g. "docker pull kernel.org/gcc".  It comes with some
maintenance burden of course, and Docker Hub has a history of
changing its policies quite unexpectedly so it's not entirely
future-proof.

A classic alternative would be to host a dedicated service
e.g. registry.kernel.org and have the images managed there.  This
would obviously involve higher sysadmin efforts and add scalability
issues but would decouple it from external providers.

Then a third option would be to host the container images as OCI
tarball dumps alongside the toolchain tarballs.  They can then be
downloaded and imported with "docker image load" or any other
container runtime.  The only infrastructure resources needed would be
storage space.  This is of course suboptimal as all the layers get
bundled together and users would have to manage these images
themselves, but it's very effective from a kernel.org sysadmin point
of view.


There are undoubtedly other ways to look at this, I'm curious to know
what people think.  The benefits of having readily-available
container images upstream appear to be pretty clear, several
maintainers have expressed their support already.  It's all down to
how much these benefits can outweigh the upstream maintenance costs.
Maybe this can be done in two steps, first with just the
Containerfiles and later on a full solution to host the actual
images.

Best wishes,
Guillaume

[1] https://lore.kernel.org/all/cover.1766061692.git.gtucker@gtucker.io/
[2] https://gtucker.io/posts/2024-09-30-korg-containers/
