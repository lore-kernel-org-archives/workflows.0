Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88CD2E63C
	for <workflows@vger.kernel.org>; Mon,  2 Feb 2026 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770034085; cv=pass; b=Wh3XoXyLJcQJlJgS/1QI/l+ftspnkpQ1jyfkyhhz5+k11CndWGHbVBlMHnOtGzDpjkL15tBRDm7HGT/Svl6FBaMjap4K+JR1IoHozS3NpVPq41BAnDjU6fiY6bmstrw0nDGJ32gUIaosLtSUxFP0r6sQBIFpKJWIGY0Um4ZluUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770034085; c=relaxed/simple;
	bh=AzjjvLOhHyWR5QRbIaHm8x8lLiVB+VRZgFLXaXKUsLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxZ7mIz3bHWI74P8o/X25nXjgF3A9hr/ORJIXIBRSngt0Y+FAsQQf+qGJzrchyzU5cbWjO4qRVN2X51cO4npk2FmjuKbJZ+AyQpMBkb+bSvSkyoQiAui2VDKVaJUXeBbhfchLTAb8y9vOXHgvaAtfH+/ku3LE+opMoWvjqoNDq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LEQBeNOM; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LEQBeNOM"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c6a0702b86so445773685a.0
        for <workflows@vger.kernel.org>; Mon, 02 Feb 2026 04:08:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770034083; cv=none;
        d=google.com; s=arc-20240605;
        b=U42+WxlSERAp4QZcL8CJ81CVAJf2xrBdOxDFJDHWLWHchpgqQKYDQSLmB0RUAhTjRz
         HMOIAVcjaGbDbkf0DCPlPF/0DPhDRCKokeO3+khG0Ga2YLcOIzL9H1Eu2RmdWFJQ22Nr
         R4Kypl7yjGJ9ZDhSiXzjDzd3elyKMhR+hsBcgfcel8sp1Zw/0l9rIZoKacxHuIqgM++k
         mGDAmjes9iirSiCw7vncb0rC/459I2xqNPr+96xe1CgMz8WpC+iWngz7Uea+0Oi6bSQD
         +iNS2V/rM1wbjyWkk7f9bCMswwcWZfkwv+XSEE88NlINLxG2o1IYDN8ABR0Wajh3rwT6
         r1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j5x39Ubve3SBr0ayGiVw9ceJXlVfrctBoM3e0isaKhA=;
        fh=rAeO3pr1bhizgdj3y7I4WkByfVmL6YDwzKYKgRI56zU=;
        b=WQdpRFnSl7iZ4xgmn1JqclQvxNqu6dRNua8/4n5DK+LYln5OGlqd4tTXclhTGOrB9g
         zGsjfQv2GAN4n0lX3eqX/uK40TZbxuuoZrwzIYHCm6wuEGH9ollezOkbP/xH8j/fRnex
         EFCTf5f6SRdib+oM2j9KXzYyQO4etQ5E05w5lPGupSqZ9jhr0xEnIchKSRVTIDVr0E9H
         cZ1zO4IA9vJF0m4wjV1dezx2s0uMn5A5wdIM8GghEpO2octOJhSxvv7+zSZ8fC3HcVq+
         hnRkAoInp1mZMhKRsZZWlilHQGbYjvH+b3K6mBPmcZrQVt804u+fKAKDvmLu1LMs+gUl
         JZvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770034083; x=1770638883; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j5x39Ubve3SBr0ayGiVw9ceJXlVfrctBoM3e0isaKhA=;
        b=LEQBeNOM37tTvq6t4m5Vv6uZ+7sPcsyKAB6b8zVRKx4l/VooiYgKb2hfASx8e3uXPK
         NOcov0dqyAOtnd0m1Q6cZrr59IIfrXOPStmz9/tZ1iMaQ4CLSgAhdhx6kC4zI5U/kfjc
         0tDlluQJtPnFeoN+nuLVJ+6GQ5awrNMEKdJHLsNxkYgRY4ViWGlMwWAdchuTW8yLvbPx
         XRtGkqrhpdBvi4zvBYIU4+bJRkiMciMHmde+CX0PDvs/KByAZTJq0nHm5LTI/r+cNuJW
         5wXPb1QFC5BxuoKvDofUjasnQEKaLFShsz3zrGqMAugEzFS/zJBTrl1pz9Er5mbT+VeD
         O6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770034083; x=1770638883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5x39Ubve3SBr0ayGiVw9ceJXlVfrctBoM3e0isaKhA=;
        b=bmqQt7yR9JSCeUxMEYpc6/c9x8qUKPMhSLwI7Nd8OK+FzIwqFI0mB+U8eZDNV3Hg2E
         v9uBif3CEuWyW7nTJKXJ5hs08Uw2ZU7zUKazdE2j0YKMlX+FvCqnGdvBuFp5+ppILYMO
         m2ivhlLkezKeC571SGH6aCey4Aftde2Tn5uqxtdo92QykkgZewbn2bTERO5DAnstM0XD
         HdibD5s1FwK7AcTFcXYuBrgEReIn2DtOvC7FydGgsqRdYtoed1XCD+vprhqBiv2ALrNI
         23kGU8vOGDFzAkCD95A2g23s6i+JnmQrtJsBcpcDrpCILj8TXFj3Qacp6oK9cGaY6lXm
         0ozw==
X-Forwarded-Encrypted: i=1; AJvYcCU3ca6JXAV6+Jt/L1AamxRhNrejBiEi6vt622JXnfjL7/l08GnspRKKv/MOZmqu4+7H1jNg7hhZ/zo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt7m2cCmLYQCWFTuRU6PaUC73T6zuie5+M+LAOK1QqiVW3UDFf
	DXdQv3yMz/rS4j+V+g9hpcb2/DEuXTL0vjnd53F02ob/Z1/B+7RWQa3dw/GsnwQpv6XHEZ5+Hez
	MWNbwx2bFktXR7PuJRdsLS8goPtDkEMr1f0bZ1H1B
X-Gm-Gg: AZuq6aI7/BDlCy31Dg93TM9uIrcykTRcTT+6BxvtOSRcHBBE/Cn2PEYs1BfyopmVUk2
	kWDateG69S7OmVj21CjBHytsR3vpvb1TmGMSfz+xEiZ9q0p1w2VetEFUFLyocpLhCBpyOopGUzc
	5Nf7tIkU61B8azzNAddSmip0+po9yBYoqoUQlhpG53HSEYnO1v1YVtERZVattV+3Odv3scBm4PL
	+DvhdpxAvMFcxFaysRiphmkBgYj12OdOzpHDPhR492X6wMehKaY7ZluWm8k9GT0dVCTWVn5ki0W
	+EbU19pXtnh7y0ivlvCRU2wa3m0gOyzm84+xRApt75p90PDR
X-Received: by 2002:a05:620a:3910:b0:856:60d8:3688 with SMTP id
 af79cd13be357-8c9eb2ef8f0mr1581300485a.47.1770034082443; Mon, 02 Feb 2026
 04:08:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io>
In-Reply-To: <cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Mon, 2 Feb 2026 12:07:51 +0000
X-Gm-Features: AZwV_Qgnw9bqn8VKfLsSnkhMhZlqSMyeptShmll48TOeGcZ39-ekWeUNl1YrqOA
Message-ID: <CAL0q8a7mepGUdgrLsQhCUdLVP8VcxB9x_oBRCWAYNeoVAUb=7A@mail.gmail.com>
Subject: Re: Hosting first-party kernel.org container images
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Arnd Bergmann <arnd@arndb.de>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, workflows@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hello Guillaume,

On Fri, 19 Dec 2025 at 13:37, Guillaume Tucker <gtucker@gtucker.io> wrote:
>
> Hi Konstantin, Arnd et al,
>
> This is a follow-up from the series about adding a scripts/container
> tool [1] to run kernel builds in containers.  As per the discussion
> at Plumbers last year and the summary I put in a blog post [2], it
> would be great to have container images with kernel.org toolchains
> hosted upstream.  This can mean several things, so let's break it
> down into a set of potential options to choose from:
>
>
> * Containerfiles Git repository
>
> There is currently a PoC repository on GitLab with a Makefile and a
> number of Containerfiles to build a set of images:
>
>      https://gitlab.com/gtucker/korg-containers

TuxMake already provides container images with kernel.org toolchains
(korg-gcc 8-15, korg-clang 11-22). The Dockerfiles are maintained at
[1]

Since TuxMake is now part of KernelCI and already referenced in the
kernel documentation you pushed [2], it seems like a natural home for
this rather than starting fresh, or having two places for images.

>
> It can be improved in many ways since this is an early PoC.  The key
> decision to make here, if we do want to have container images
> supported upstream, is how to manage these files or a derived
> implementation.
>
> One option is to add it to the kernel tree itself under e.g.
> tools/container.
>
> Another option is to add a separate repository on git.kernel.org,
> which I believe would be a better approach as there aren't any direct
> dependencies on the kernel tree itself.
>
> A third option might be to keep it alongside any recipes used to
> produce the existing kernel.org toolchain tarballs although I'm not
> entirely sure how that's managed - something for Arnd to judge I
> guess.
>
> A last option would be to keep it on GitLab or move it to GitHub
> which would provide some CI/CD tools for building the images but I
> doubt this is something viable for the kernel community as it would
> create some vendor lock-in.
>
>
> * Container image registry
>
> This is where things get a bit more complicated.  As far as I'm
> aware, there aren't any container registries hosted in the kernel.org
> infrastructure at the moment.  A classic option would be to push the
> images to an established one e.g. Docker Hub (docker.io) or the
> Google Artifact Registry.  GitLab and GitHub also provide theirs of
> course.  I believe there is still a free plan for community projects
> to host images on docker.io and that would be the easiest from a user
> point of view e.g. "docker pull kernel.org/gcc".  It comes with some
> maintenance burden of course, and Docker Hub has a history of
> changing its policies quite unexpectedly so it's not entirely
> future-proof.

The images are hosted on Docker Hub (https://hub.docker.com/u/tuxmake)
with ECR Public as fallback:

      docker pull tuxmake/arm64_korg-gcc-14
      docker pull tuxmake/x86_64_korg-clang-22

Happy to discuss how we can align efforts here. But to me, it makes
sense for KernelCI to be the place for these images (or for us to have
a single place and a single set of images).

[1] https://github.com/kernelci/tuxmake/tree/master/support/docker
[2] https://www.kernel.org/doc/html/next/dev-tools/container.html

Regards,

Ben

>
> A classic alternative would be to host a dedicated service
> e.g. registry.kernel.org and have the images managed there.  This
> would obviously involve higher sysadmin efforts and add scalability
> issues but would decouple it from external providers.
>
> Then a third option would be to host the container images as OCI
> tarball dumps alongside the toolchain tarballs.  They can then be
> downloaded and imported with "docker image load" or any other
> container runtime.  The only infrastructure resources needed would be
> storage space.  This is of course suboptimal as all the layers get
> bundled together and users would have to manage these images
> themselves, but it's very effective from a kernel.org sysadmin point
> of view.
>
>
> There are undoubtedly other ways to look at this, I'm curious to know
> what people think.  The benefits of having readily-available
> container images upstream appear to be pretty clear, several
> maintainers have expressed their support already.  It's all down to
> how much these benefits can outweigh the upstream maintenance costs.
> Maybe this can be done in two steps, first with just the
> Containerfiles and later on a full solution to host the actual
> images.
>
> Best wishes,
> Guillaume
>
> [1] https://lore.kernel.org/all/cover.1766061692.git.gtucker@gtucker.io/
> [2] https://gtucker.io/posts/2024-09-30-korg-containers/
