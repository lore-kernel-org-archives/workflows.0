Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B2E3B19A9;
	Thu, 19 Mar 2026 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916639; cv=none; b=aWyXS7108ifobD/2Y+sj4GQIUaiSSWDTTu3JPuA66yJ/+rC9Lm7UEueTCY+i+AD53bh5B3dUjKAxVOK1lI1EHZSn730HaVogtEJGX0ADoziigTA01mza/SBpz/WQliE+s5tVm9kpP9Gtqw6GgKrxFyIYhBHW3w5LUBZyvWKjnhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916639; c=relaxed/simple;
	bh=4RNjjiymWwbOr3wxhuyz7qkwTVm0dOg0QO4FOy3IBT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LT49qw7Ztn/IguQTZ0KrZZxNfA4rROiecNQDhrTGSKxZey8nMA93fuTX+dJZXr7NefwWExpkAoH/xlIwM4H9A0f3snS51Rn+OtJaelJ16OV6hdoFlLH5wA+bXmliAMzUrih0tYbShQS7+kmECiSjPG6k4XZiI0yxKTia9Jw0vD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=EtCumurJ; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="EtCumurJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4439B3EBBA;
	Thu, 19 Mar 2026 10:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1773916628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vsy8MtHkIqSDCVwD8U9hBJLdViUy3psVdXn0LP3qlek=;
	b=EtCumurJrQ1fncBc+fReJ9BE6S/F1Z3fgoxWUivaFeRICQe/jfvCZBA8HjswbUF26kpc57
	0ecdON4OhXs5QptdbvSeiWsICV9+tQ06d55jEDKrTU067zcVzMs0kwYAB2sgxAJ7njWUPG
	o1WAv4551xfsa9Cecfxs4UGePpzA3wgX3jH8dGQOMOLTOwRBXJzMJb5qKqGo3OG5O725Kw
	ATBEDBjafDx6zFPpU1V1XxgzDVzLswabuT8AbuQWfZ4N+ptPT1JWe7OVBmlomcCaXQBafj
	wvqr+5Gs9t3MpiWVJzeK9Jz85kfbor5bAWsAVsqDkujY2ZTQwLiCt6uGVcyvFw==
Message-ID: <81522f93-6fe2-48e0-b95f-654a83f8b6ba@gtucker.io>
Date: Thu, 19 Mar 2026 11:37:04 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hosting first-party kernel.org container images
To: Nathan Chancellor <nathan@kernel.org>,
 Ben Copeland <ben.copeland@linaro.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 workflows@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io>
 <CAL0q8a7mepGUdgrLsQhCUdLVP8VcxB9x_oBRCWAYNeoVAUb=7A@mail.gmail.com>
 <78adef0e-81b0-47d4-be20-32f42ab8ec04@gtucker.io>
 <20260310004815.GA3293460@ax162>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20260310004815.GA3293460@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdeijeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpeetteduieffheeivedvkeejveefheeggedvuddtheetgfekffeivdeljefhveefhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdguohgtkhgvrhdrtghomhenucfkphepudejiedrudehledrjedurdegleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirdduheelrdejuddrgeelpdhhvghloheplgduledvrdduieekrdduheejrdeigegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeeggeefleeufefgueeutedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhdrtghophgvlhgrnhgusehlihhnrghrohdrohhrghdprhgtphhtthhopehkohhnshhtrghnthhinheslhhinhhugihfohhunhgurghtihhonhdrohhrghdpr
 hgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnshgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv

Hi Nathan et al,

On 10/03/2026 1:48 am, Nathan Chancellor wrote:
> Hi Guillaume,
> 
> On Wed, Feb 25, 2026 at 03:44:13PM +0100, Guillaume Tucker wrote:
>> This boils things down to a few practical options:
>>
>> 1. treating TuxMake images with kernel.org toolchains as the de facto
>>     stardard,
>>
>> 2. creating a repository from scratch on git.kernel.org with
>>     independent hosting for base images,
>>
>> 3. some middle ground to be defined which would remove the risks
>>     associated with third parties without duplicating efforts.
>>
>> I feel it would be good to have more maintainers' feedback though.
>>
>> Nathan, Nicolas, Miguel - what are your thoughts on this?
> 
> To be entirely honest, I do not really have a strong opinion here. I
> generally agree with your thoughts around branded container images,
> although I do think that TuxMake's images tend to be fairly lean, so
> those easily could become the recommended images without many downsides
> aside from maybe where they are hosted and how they are maintained.
> Having a clean set of Containerfiles on git.kernel.org does not sound
> like a bad idea, especially if they would be structured in such a way
> that other entities could customize them for their use case further. I
> guess its usefulness really depends on the other stakeholders like
> KernelCI. It seems like there has to be some sort of buy in from the
> kernel.org administrators around hosting built container images
> somewhere on kernel.org though, as I don't think the regular developer
> is going to want to build images locally. Not really sure what that
> looks like.

Thank you for the feedback, it's very valuable even without a strong
opinion regarding the 3 options in my previous email.  It also tends
to confirm that the risks I mentioned aren't too critical to get
started, having some developer adoption is more important for now.

With all this in mind, I believe we can follow a step-by-step
approach to start simple and deploy more tailored solutions as and
when the need arises.  This can be seen as a bit of a Beta testing
phase until there is enough momentum to look into the longer term.

So here's what I would like to propose for the short term:

1. review current TuxMake kernel.org toolchain images[1] and
    determine what needs to be added or changed there (e.g. I don't
    see any GCC ones right now)

2. update the scripts/container tool to rely on tuxmake korg images
    with default entries in a reference user settings file

3. encourage kernel developers to go and try it out and provide
    feedback, maybe even run a small community survey

4. review the situation after a while e.g. once v7.1-rc2 is out and
    decide what steps to take next based on community priorities

I believe there aren't any blockers here so we can probably just give
it a try as an experiment and see how it goes, unless someone has
anything else to suggest.

Things like moving the Containerfiles to git.kernel.org or hosting
the images in a dedicated registry etc. should eventually emerge by
themselves if there is a real need for them.

Best wishes,
Guillaume

[1] https://hub.docker.com/u/tuxmake?search=korg

