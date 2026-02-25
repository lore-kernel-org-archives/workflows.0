Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7CD1E3DF2;
	Wed, 25 Feb 2026 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032180; cv=none; b=ou0GyAASidnluPEHDMYG0R//tv8h3K8oE7kPGKXE6AdmxPQAK0vdF+FantOpXtwD1IUyn8gmrwZ0NUg49LULh221jpwbDacGQavhwn66fXjGYTZnEDvOI9WyVNsZUto7p8QFsZAS4M5eYFzq9+u1R7V87KW72K9uILwDr+6PpBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032180; c=relaxed/simple;
	bh=cAZIyTOs6Iwv3H5nrlp6FRxc7fdW6YqVSKOoUYH2bL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVaUU43dghDkuQrcpR9Anfrm+6FvWtyW1T4g8pSBxPCKg/U2iPX3hfXp4Io9w7gWZju4bgZkCLVD6vNBTliK1l41J4WsJlDBjS3as54ToE1x5nl0gXhmNHt+SXsIIHwK5wqsUU+4jpA0o8j8GxV2FfFwHYRnZ72a+V4odUYdT9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=jig+VCuM; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="jig+VCuM"
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 8562B581EA2;
	Wed, 25 Feb 2026 14:44:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DBAF41CC4;
	Wed, 25 Feb 2026 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1772030656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UKHEq0UOUXcD+LTBdlIV94iOGhkbTLNDLMo+Ye60/AE=;
	b=jig+VCuMHmxmx2qQtlMq7PROmJSyM++sNx3ZbKPppmmxGK1vZEJL9RyYLTx/++BUKKBNuf
	wabJHk536hpV2qON9oG2y5927Os/j0kEOrvMyl2PGDzsSJ/yIaMAg9ktyfiHk2tlh4PagF
	nWbsOVp8HUtBUdOax5ma1VITuyMvKMgvXQkdHmb5NuFMfYADtfIwfJbrUKjHHS6yU1pWvl
	CkrO52zV9dM0CjyfGkGH0A0EkWKQRto4mmzFogpfzu/uyCD9CP7YB76XBPrfZ/CZA18jhU
	7D65UypfGq8LauYOCRSnVEzmVhedKJlvYhnpatohC/Y3Hyg/xlFi6CmCSSLE8A==
Message-ID: <78adef0e-81b0-47d4-be20-32f42ab8ec04@gtucker.io>
Date: Wed, 25 Feb 2026 15:44:13 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hosting first-party kernel.org container images
To: Ben Copeland <ben.copeland@linaro.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 workflows@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io>
 <CAL0q8a7mepGUdgrLsQhCUdLVP8VcxB9x_oBRCWAYNeoVAUb=7A@mail.gmail.com>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <CAL0q8a7mepGUdgrLsQhCUdLVP8VcxB9x_oBRCWAYNeoVAUb=7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeeffeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhohgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhephefhlefhkeeigfeijeevtdffkedvjeevvedvffekiefhvedthffgueefffehtddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmpdguohgtkhgvrhdrtghomhdpghhithhhuhgsrdgtohhmpdhgthhutghkvghrrdhiohenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeeivgehheemrggvrgehmeduuggsleemtghfvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeeivgehheemrggvrgehmeduuggsleemtghfvddtpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmeeivgehheemrggvrgehmeduuggsleemtghfvddtngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepkeffueethfegudevveegpdhmohguvgepshhmt
 hhpohhuthdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepsggvnhdrtghophgvlhgrnhgusehlihhnrghrohdrohhrghdprhgtphhtthhopehkohhnshhtrghnthhinheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg

+kernelci

On 02/02/2026 13:07, Ben Copeland wrote:
> Hello Guillaume,
> 
> On Fri, 19 Dec 2025 at 13:37, Guillaume Tucker <gtucker@gtucker.io> wrote:
>>
>> Hi Konstantin, Arnd et al,
>>
>> This is a follow-up from the series about adding a scripts/container
>> tool [1] to run kernel builds in containers.  As per the discussion

The scripts/container tool has now been merged so it's on its way to
be part of v7.0:

    https://docs.kernel.org/next/dev-tools/container.html

As such, the topic of maintaining first-party container images is
becoming even more relevant.

>> at Plumbers last year and the summary I put in a blog post [2], it
>> would be great to have container images with kernel.org toolchains
>> hosted upstream.  This can mean several things, so let's break it
>> down into a set of potential options to choose from:
>>
>>
>> * Containerfiles Git repository
>>
>> There is currently a PoC repository on GitLab with a Makefile and a
>> number of Containerfiles to build a set of images:
>>
>>      https://gitlab.com/gtucker/korg-containers
> 
> TuxMake already provides container images with kernel.org toolchains
> (korg-gcc 8-15, korg-clang 11-22). The Dockerfiles are maintained at
> [1]
> 
> Since TuxMake is now part of KernelCI and already referenced in the
> kernel documentation you pushed [2], it seems like a natural home for
> this rather than starting fresh, or having two places for images.

Thanks Ben for the input here, these sound like very good points and
the situation has improved since the idea of having upstream
containers was first initiated.  The TuxMake images are mentioned in
the documentation as they're already available so it made sense in
practice.

>> It can be improved in many ways since this is an early PoC.  The key
>> decision to make here, if we do want to have container images
>> supported upstream, is how to manage these files or a derived
>> implementation.
>>
>> One option is to add it to the kernel tree itself under e.g.
>> tools/container.
>>
>> Another option is to add a separate repository on git.kernel.org,
>> which I believe would be a better approach as there aren't any direct
>> dependencies on the kernel tree itself.
>>
>> A third option might be to keep it alongside any recipes used to
>> produce the existing kernel.org toolchain tarballs although I'm not
>> entirely sure how that's managed - something for Arnd to judge I
>> guess.
>>
>> A last option would be to keep it on GitLab or move it to GitHub
>> which would provide some CI/CD tools for building the images but I
>> doubt this is something viable for the kernel community as it would
>> create some vendor lock-in.
>>
>>
>> * Container image registry
>>
>> This is where things get a bit more complicated.  As far as I'm
>> aware, there aren't any container registries hosted in the kernel.org
>> infrastructure at the moment.  A classic option would be to push the
>> images to an established one e.g. Docker Hub (docker.io) or the
>> Google Artifact Registry.  GitLab and GitHub also provide theirs of
>> course.  I believe there is still a free plan for community projects
>> to host images on docker.io and that would be the easiest from a user
>> point of view e.g. "docker pull kernel.org/gcc".  It comes with some
>> maintenance burden of course, and Docker Hub has a history of
>> changing its policies quite unexpectedly so it's not entirely
>> future-proof.
> 
> The images are hosted on Docker Hub (https://hub.docker.com/u/tuxmake)
> with ECR Public as fallback:
> 
>       docker pull tuxmake/arm64_korg-gcc-14
>       docker pull tuxmake/x86_64_korg-clang-22
> 
> Happy to discuss how we can align efforts here. But to me, it makes
> sense for KernelCI to be the place for these images (or for us to have
> a single place and a single set of images).

Yes, I see the value in consolidating things rather than duplicating
efforts.  However, I believe there are still a few good reasons worth
considering for keeping a separate set of images:

* images related to a tool e.g. TuxMake or KernelCI are less likely
  to be adopted by developers

CI bots and other services are a subset of the use cases for these
container images, so if they're branded as being tool-specific then
developers will see them as specialised images.

An ideal approach, if there were no images already published
anywhere, would be to have Containerfiles and images coming directly
from kernel.org and then specialised use cases would base their own
tooling on top.  I know the current TuxMake images with kernel.org
toolchains don't have TuxMake-specific packages installed in
principle, but they're still branded as TuxMake and it's hard to tell
how they might evolve.

* external projects can have their own agendas

Projects such as TuxMake and KernelCI may decide to host images on
docker.io and code on GitHub for now, which may not be the preferred
choices for the kernel developers' community.  Then if the projects
are forced to move hosting because of pricing or limitations, it's
also likely to be for reasons beyond or against the community's best
interests.


Creating those container images isn't particularly challenging in
itself, the main point is to align use cases with a standard set of
images to facilitate reproducible builds across the board.  And the
main part of the maintenance work is to keep them up to date,
functional and available.  As such, any pre-existing implementation
or hosting solution doesn't seem like a big factor for deciding what
to host and where.  Rather, the interests and resources associated
with them are critical.  In other words, it's much easier to create a
new repository from scratch on git.kernel.org and implement a new way
of building these images there than having to deal with the ongoing
risks associated with third parties.

This boils things down to a few practical options:

1. treating TuxMake images with kernel.org toolchains as the de facto
   stardard,

2. creating a repository from scratch on git.kernel.org with
   independent hosting for base images,

3. some middle ground to be defined which would remove the risks
   associated with third parties without duplicating efforts.

I feel it would be good to have more maintainers' feedback though.

Nathan, Nicolas, Miguel - what are your thoughts on this?

Thanks,
Guillaume

> [1] https://github.com/kernelci/tuxmake/tree/master/support/docker
> [2] https://www.kernel.org/doc/html/next/dev-tools/container.html
> 
> Regards,
> 
> Ben
> 
>>
>> A classic alternative would be to host a dedicated service
>> e.g. registry.kernel.org and have the images managed there.  This
>> would obviously involve higher sysadmin efforts and add scalability
>> issues but would decouple it from external providers.
>>
>> Then a third option would be to host the container images as OCI
>> tarball dumps alongside the toolchain tarballs.  They can then be
>> downloaded and imported with "docker image load" or any other
>> container runtime.  The only infrastructure resources needed would be
>> storage space.  This is of course suboptimal as all the layers get
>> bundled together and users would have to manage these images
>> themselves, but it's very effective from a kernel.org sysadmin point
>> of view.
>>
>>
>> There are undoubtedly other ways to look at this, I'm curious to know
>> what people think.  The benefits of having readily-available
>> container images upstream appear to be pretty clear, several
>> maintainers have expressed their support already.  It's all down to
>> how much these benefits can outweigh the upstream maintenance costs.
>> Maybe this can be done in two steps, first with just the
>> Containerfiles and later on a full solution to host the actual
>> images.
>>
>> Best wishes,
>> Guillaume
>>
>> [1] https://lore.kernel.org/all/cover.1766061692.git.gtucker@gtucker.io/
>> [2] https://gtucker.io/posts/2024-09-30-korg-containers/

