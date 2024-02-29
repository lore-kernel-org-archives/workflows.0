Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB4013F420
	for <workflows@vger.kernel.org>; Thu, 29 Feb 2024 20:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709238082; cv=none; b=TNWdGs/z+DFbOD5xerOcYg4RyfW5c+8UqMFT6nOF7wFphbdmTWuSeptdg9CqsogsbQn/r/zdMkVFjgdNTFrX/SJ2QeI/xq1jvacDvNZkuE4OnneZpUw79ydg2t5J7i5WaX15nWVaVJJWu9sx+iBCzbonjUG3w72/pLxxpUew50o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709238082; c=relaxed/simple;
	bh=uXWrJbshZP7CBnPLaekgrXuRiji+uddEtfNEXyijjLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXv6tbsMdaKVHNXrzjdDVPkLzvvLjp8UcSloHfWZU+NPhRbzRNKw11s79O8xyoOVJv46n9ptemdtqBqDQSAuUSHrZIpJ59LzRRrN5dNM6fcqwpDusSyWr//srYojlTUTfDvyLASKM2G3a+UZzFH8Da2JSZ6rjkVpbx6YiXTScH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UlXHl1B5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UlXHl1B5"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a441882f276so193726066b.2
        for <workflows@vger.kernel.org>; Thu, 29 Feb 2024 12:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709238079; x=1709842879; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k0i0PgDtVBoPSBAUnZ0cg1G8fT87ylUFojqmg8T1gpw=;
        b=UlXHl1B5HUAfDLiCSYcykEpLRlVRTtFSEIQOljSoH6A3WFX+EjBnAGYuhiTU3xzlM9
         TsTkOLtfRmMSnxRgzXyznCTkltMllH7/s/GeSFvtzUocJnGoviOe61InHrw/18eogGXe
         AiQzNmFMgSAwOO2KjvLXYwWlnpSLBxM0e5Vao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709238079; x=1709842879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0i0PgDtVBoPSBAUnZ0cg1G8fT87ylUFojqmg8T1gpw=;
        b=hZgBodrnnqeSCgst4ErqRqmR4gQ17iBPCftgXI9kNekWl1voIcfIbaXmHYY/sjcIx9
         OHTC7GdCIuJGqcj991DcdDD5bbK9iCR1GcGV8xC/G0B5iKaHXqOQLmTMFXCV2DZjDHkd
         ekhoL1+imDbA2WzG7fOQrKcsJUE05K8UAtjSM/tPWrH2Om3FVhdGAUs6RfuTAKfdCpC0
         PUsiXik+7taMeUqx4BuZ3D0VhP+9HgThEVoW+ReWzODY9y0omoQjK2EdnT7W5Db7jhEu
         B81AAqmsRIwMPph0zyHuQaMRfZVAmOpPV5IOAqa2YAYOK0u+YUy9wdFuAeTXG5YRTKtd
         Vs5w==
X-Forwarded-Encrypted: i=1; AJvYcCWJJVRAW9mxZjMEGOP0dN1lFUfo8aARleiZPUm5tHl1nR60d01m1bSfgqt85+oHScylSRAcizGPcqcLRnkwsX+nwc4/cJ026Wru
X-Gm-Message-State: AOJu0YyqrkGOVSaT0Vix+52fTwHiIjT95yFTdThLIkvXrGTfIGOnXpPD
	4Nxq7h9j3f935b7SfnRgaSWWbtNZu16mEYj5UmZEhP47373KuELtvgGtHsPq4aJTEUHYGTSNYP3
	eON1Lug==
X-Google-Smtp-Source: AGHT+IFzPPf0WhLYhasV58Di3lcvpsSxCJ756OCRd0HPnlQNVwZRuS/oiwOh1ie/1vdwbFyMNTC3nw==
X-Received: by 2002:a17:906:b30d:b0:a43:a628:ff31 with SMTP id n13-20020a170906b30d00b00a43a628ff31mr39677ejz.26.1709238078796;
        Thu, 29 Feb 2024 12:21:18 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id ss18-20020a170907039200b00a44230eafdfsm1005986ejb.83.2024.02.29.12.21.17
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 12:21:18 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a26fa294e56so265145866b.0
        for <workflows@vger.kernel.org>; Thu, 29 Feb 2024 12:21:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTp1D+DOOb+3w4AGY/D4dUGj0SA32LuhynQb4FPKY6upEWrWqQHHmL6GnE0+kSedWPRuiCJy+gl0/MLlrsC7ohW6y7P5omGJCb
X-Received: by 2002:a17:906:d9c9:b0:a3f:1cb6:fb00 with SMTP id
 qk9-20020a170906d9c900b00a3f1cb6fb00mr12394ejb.69.1709238077400; Thu, 29 Feb
 2024 12:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com> <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
In-Reply-To: <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 29 Feb 2024 12:21:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
Message-ID: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Helen Koike <helen.koike@collabora.com>, 
	linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com, 
	pawiecz@collabora.com, tales.aparecida@gmail.com, workflows@vger.kernel.org, 
	kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
	kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
	cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
	ricardo.canuelo@collabora.com, kernel@collabora.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>
> However, I think a better approach would be *not* to add the .gitlab-ci.yaml
> file in the root of the source tree, but instead change the very same repo
> setting to point to a particular entry YAML, *inside* the repo (somewhere
> under "ci" directory) instead.

I really don't want some kind of top-level CI for the base kernel project.

We already have the situation that the drm people have their own ci
model. II'm ok with that, partly because then at least the maintainers
of that subsystem can agree on the rules for that one subsystem.

I'm not at all interested in having something that people will then
either fight about, or - more likely - ignore, at the top level
because there isn't some global agreement about what the rules are.

For example, even just running checkpatch is often a stylistic thing,
and not everybody agrees about all the checkpatch warnings.

I would suggest the CI project be separate from the kernel.

And having that slack channel that is restricted to particular
companies is just another sign of this whole disease.

If you want to make a google/microsoft project to do kernel CI, then
more power to you, but don't expect it to be some kind of agreed-upon
kernel project when it's a closed system.

               Linus
