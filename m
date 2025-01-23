Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F5E288A2
	for <workflows@vger.kernel.org>; Thu, 23 Jan 2025 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647235; cv=none; b=o2qpilbkFDsgxzm5X5+8qaD/7F5/OR7j4/cwZAPQ9TOHIpzrRUXguYBrK/D+ZM/Y8yAosJ+vm5O4E5nysCRBwZ69gHWmNUdp9MGy7CPYINEHaml8BAXDGdNshj2ag6mYUCnpEXFMQvaHyyA5qFHn07taFPAOVdYOQ7SSUYZdck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647235; c=relaxed/simple;
	bh=C+6VTFf4oQZgdC2iMUDsKcOtxuNkydWnEcm+CAZfMB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2yRQstUSJWI1n6yuXrRBHNNOPA5eELtuL+57jZQPclJW9uGSMMG29gfqS0BaLpMsLmqupVZz3xMCfdJNmix/PIdan+oSK/ML9fkMG09zhzu5jLFZZ9/8WG8Nf7BbtHZ9Jsr+DUhTmA7R1Gj8SBplDrnKMkudzygEMpoXntCIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XgwUvteX; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XgwUvteX"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaedd529ba1so164880066b.1
        for <workflows@vger.kernel.org>; Thu, 23 Jan 2025 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737647231; x=1738252031; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5c1ACikcoZvFxPEfQa5a/N07yqND3XkMMWgBnWWCeno=;
        b=XgwUvteXRQXORHyTrN6ibgDej71OcLscyRYksK6SYAqhCr3FDqaj/YjO8Imq/p5LZB
         AjbO3xV7jNSnDAoO+p2zgKQe9EAftwR/gb21WeXPyYnEB5uIy6APPrQ6T6/RmOPt4KiY
         fEOVzW6yUn/hTnTC3M0VGhZ2chUlLUdOIPoSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737647231; x=1738252031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5c1ACikcoZvFxPEfQa5a/N07yqND3XkMMWgBnWWCeno=;
        b=RhReSayxnGCVK256jUrLgycIeVG81QfmhF1i3KIHomyvOjIxf1g0a9VxJQ1Ga2fw0R
         7jLPGWxm/SwjW7X9XjTOQmnQwvLFN44oQqUFyI09TQVEPewDgpl0JEQsrDZVtCwg3mqX
         FYwPpU4v1Rb55hEvrdl9e9QTczyFaB5rWtvmn2Jm3r+QTlgmGsUhpKJrdsZylTnWc1Kq
         sF2IMW3tEmnkFquNtMorWBXIPWexW2rXRqBq5TcehBeDfnhkzptBZo96Hsbh51OUv2K5
         UGZSrzCBT6q4jkhObcPZJ9dyHU8XlZFRLEqfq1bssdupZFrrMBel38DTpHXDqT0l4qfu
         JnOw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ4O6YAzTPS1N7mmc/2chtM6P7pg5tO4VtISfmWUZXhcEe8xZ/0jdZinqsZ44N1y690HWYKPKAt1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/cmP9PVxN3dXiohbYQvqCFvlTjswlLfVjQJuxyKVMeQbssIHE
	zMp/R5WehVuS9bGyK4zVJ5mJX2UZwW3uTgQ7tseVCl8pPX276GAjgtD0xiSq0VK5I2j+W4Lv/q8
	GNoA=
X-Gm-Gg: ASbGncuYFAT6SBD2q9s1TgK1MqZ+THqDPDsP5erlFNIJLnGIz02bfk+1P9goxhPv6+d
	ieCYKMFUCJlHeA+uWFSEjkKFMayB9bZP+VWuWWym/GQh2uEqfRfU+cIkdsfg24d5m57NKVbx6Qa
	6eouq8I5HHs9wjZewM+jm9srNp0K4UCol/sS42O9F2ZgrxQLcOjj7J1/E8Rjep7miBEVONmBW1h
	DGb3oiYdyOofVH0pqySeXVJiMbk30jgUEiVf4X1DknK6V7SsPbs3ljA4STIZf9hu6Mkd/hJirtD
	FVetuKDHalrXYpI0BeEAkpJpSekM+bKR4GpUZoiGKSZU0Yv6chsL6w==
X-Google-Smtp-Source: AGHT+IF/1QPegf+vOQ+H6CseIxzhkMJa0qOzfZ4dLDapoc5aJb2loJeg7M2vKvLEob0BG2Qvl3RPYQ==
X-Received: by 2002:a05:6402:1ed1:b0:5db:f423:19cf with SMTP id 4fb4d7f45d1cf-5dbf4231ae1mr16545154a12.9.1737647231618;
        Thu, 23 Jan 2025 07:47:11 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d2caf0sm1078620566b.80.2025.01.23.07.47.11
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:47:11 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaedd529ba1so164878066b.1
        for <workflows@vger.kernel.org>; Thu, 23 Jan 2025 07:47:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUf/SfAB4MYOo7fxsa34VsLtrSeLy2ilHTupEq/+Wa/gsO/ekoKkyOrAEKdbawYX+pMp4qKBVKAWJQ=@vger.kernel.org
X-Received: by 2002:a05:6402:3595:b0:5db:f4fc:8a08 with SMTP id
 4fb4d7f45d1cf-5dbf4fc8bf6mr18353711a12.6.1737647230858; Thu, 23 Jan 2025
 07:47:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123135342.1468787-1-vignesh.raman@collabora.com> <20250123135342.1468787-6-vignesh.raman@collabora.com>
In-Reply-To: <20250123135342.1468787-6-vignesh.raman@collabora.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 23 Jan 2025 07:46:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiWcw-aPcMvWYqJDqxopPYXnPnVgFYAUSkvkRPTjO83uQ@mail.gmail.com>
X-Gm-Features: AWEUYZkvzfVO2hileHLKdeINWEzbU9zhoxsfXAWcm9kmxXjIcn6s0um9krEKyaE
Message-ID: <CAHk-=wiWcw-aPcMvWYqJDqxopPYXnPnVgFYAUSkvkRPTjO83uQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] kci-gitlab: docs: Add images
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: kernelci@lists.linux.dev, linuxtv-ci@linuxtv.org, 
	dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
	gustavo.padovan@collabora.com, pawiecz@collabora.com, spbnick@gmail.com, 
	tales.aparecida@gmail.com, workflows@vger.kernel.org, 
	skhan@linuxfoundation.org, kunit-dev@googlegroups.com, 
	nfraprado@collabora.com, davidgow@google.com, cocci@inria.fr, 
	Julia.Lawall@inria.fr, laura.nao@collabora.com, kernel@collabora.com, 
	gregkh@linuxfoundation.org, daniels@collabora.com, helen.koike@collabora.com, 
	shreeya.patel@collabora.com, denys.f@collabora.com, 
	nicolas.dufresne@collabora.com, louis.chauvet@bootlin.com, 
	hamohammed.sa@gmail.com, melissa.srw@gmail.com, simona@ffwll.ch, 
	airlied@gmail.com, Tim.Bird@sony.com, laurent.pinchart@ideasonboard.com, 
	broonie@kernel.org, leobras.c@gmail.com, groeck@google.com, 
	rdunlap@infradead.org, geert@linux-m68k.org, michel.daenzer@mailbox.org, 
	sakari.ailus@iki.fi, jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Jan 2025 at 05:56, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
>  Documentation/ci/gitlab-ci/images/drm-vkms.png | Bin 0 -> 73810 bytes
>  .../ci/gitlab-ci/images/job-matrix.png         | Bin 0 -> 20000 bytes
>  .../ci/gitlab-ci/images/new-project-runner.png | Bin 0 -> 607737 bytes
>  .../ci/gitlab-ci/images/pipelines-on-push.png  | Bin 0 -> 532143 bytes
>  .../ci/gitlab-ci/images/the-pipeline.png       | Bin 0 -> 62464 bytes
>  .../ci/gitlab-ci/images/variables.png          | Bin 0 -> 277518 bytes


This seems excessive.

We have a few images in the tree, but they tend to be either the
penguin logo or various source SVGs.

Not a set of random screenshots or whatever.

         Linus
