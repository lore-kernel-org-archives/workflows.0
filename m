Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2694A517BAA
	for <workflows@vger.kernel.org>; Mon, 21 Sep 2026 22:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790028182; cv=none; b=Ocp/0uOctFAeNrN8w4f8VB+a9UmNo2y8mor6+YUzI5bNchG/w0YC7C50rGobQ1I6RKqsFrSvyp/jHYCv/CMJx0inOw+HhHw+cgz7FKfyrXJN5YAYd7MtiJ0THUBD8dpc4d9rYkbTqFkI4n8cHDjol1lUmqSEjx3k+H/1Gh5ssaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790028182; c=relaxed/simple;
	bh=shG8KXW4PQjczsVN5thTIyvI36GIUWB78/X5RvdZElY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHizFjcoRDDVhnBjdbUvWGnyqAY9bJeXXqglBUHmOFfiJRJxM/fMbBrI9L4S9Z/xIF/4ar+/xFZ3h+yGxyJ4ZQJmMoaEx2x/tphofc+1cISzYNLEIqyBfCzR63XHt5NF/B8EkhP/KycYmjDXL8AYxH/oYPXajPiWL1BzIbYvSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzUpolXx; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzUpolXx"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so3173921a91.0
        for <workflows@vger.kernel.org>; Mon, 21 Sep 2026 15:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790028179; x=1790632979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gepwJu0inr/K6hhzbtKFbBFZxbpwwX/vIYPNA2EMfyU=;
        b=AzUpolXxYTy/mYtWta5mmdbInYgJMkhVRaaeUincGOvqguBo9gQRymZCcRjNcp++nH
         M2h7V5XCHi9ygoVTK8rpHpZkpkGT/K6BXFG+KwLMUfa43uAFeqeQav5jk08d/6Hlv1Uw
         SDG6cmgGAKOc0B3oeOy1doxP2siKL05vhZxY6m7qm0kckAqKYlJU2lcxJoDfWlVhKOT8
         PCILkHggG5clmMaHDrL3KkGkzO7OUt1Q0wQlvgU+Mnqj0xo2VtTLKaAtmwJA2Yh9m7fA
         alYpvngcCoJf+MBQkLlLN7mU68rc2RMwc7UfW+v07yBr9xtRkCWxBCK10nkg4Theha2d
         3Frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790028179; x=1790632979;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gepwJu0inr/K6hhzbtKFbBFZxbpwwX/vIYPNA2EMfyU=;
        b=di9jHHxP+aj8d5DGbvHMpTYe6s968alNfVGPf31nfdB22t9hZtEWy7t5eTws+GrI2Y
         98EQRhdZsO6+heHtrOq9+76DkqDBPCyTHhZ4aU1AfGAmD+uuiBOY4rkutL0ScPyKWgl9
         ZPrhuKimAeKiDWGrsiIx8FdSojz3YIgaH39B4nkeYlvQqDAYzzFoaMitYxA1Ov4IhCyB
         qFnpQz1VpuV3FtOtmSQBvYcYlDnindxDZQlTYs5aK9Ubbbhg31NIq0aoVTpoydCfRy9N
         tHBabuXgsD4/j0j8OUf0C6m4HyuNp19NgTBW6HKZSwuxfw80L9hPyLW0fgN8baiSkKgQ
         HGNA==
X-Gm-Message-State: AFuF++mBkRZSUDaKCsoHIeK4c3mDh4sq3hG7MAUagCPG2tGaBFZVKJaR
	wL7ME6G7aajHb6ywMtB1MZccEmKp8A1qAyFYXGHHTH51Rrxq0RKn/jgv
X-Gm-Gg: AYBFou0ovMVcgjdujnMn7N9fmmGtcik3DFRKRb2xEvYijAlmuoYlA9hbpMMrwZowmtg
	hWnC8XzQ3uenReyCO4XjvJGjbZUjUYNM+H+7DuqCU4RXiuche7Kd9n9UcD7eayYkAjW/27Csknm
	WZCJEn1/0VjJFSHz6FqNRbJO2ivWaovxUSmZDiSXcMSwPZt4kRqI3zI27DVX3RkQwO09CPdrI/e
	aaS89mfch29vpkiNc7wBxmhDfkQtRrlOTICoJP2D6wiKRuezbVpEpc84mBw65ffJi0TSzCiUjPH
	HBhjyrNyVZJ1X3wh4Ae71B61Qwdd+5EMC/v5BzO9VLvWzNKNmKn5Y1h2IlK624vTKJhHPmjRPKW
	m5dGEDTtBIRugYQIfeKWfZIi0p7yLR1+l3FJN5/EjblSIA+C5yhAlBf+HN4b6/1UgDwYxpm3fyV
	6yl6IHfKfsB0jxJzuqxvLhA2gGLt3EIT8Ux62PIrI2dKCZznFdjXrw6Ota74RoaUftxvro2eki+
	VUiWN4md4vd
X-Received: by 2002:a17:90b:224c:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-39e5504bf2dmr17605477a91.27.1790028179281;
        Mon, 21 Sep 2026 15:02:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069a0c7aesm664323a91.16.2026.09.21.15.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:02:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 15:02:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Semyon Fedyukovich <yohimik@gmail.com>
Cc: workflows@vger.kernel.org, torvalds@linux-foundation.org
Subject: Re: kerneltests.org master run: 23 slot-hours, 3h52 wall; questions
Message-ID: <ef72b5e7-0d59-4d27-a7d9-ce0c1f15374f@roeck-us.net>
References: <CAO1xQyW+_R4LQkmA73WHPGi+FHF2zC+urRKaMFU9LhdgA1fYmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO1xQyW+_R4LQkmA73WHPGi+FHF2zC+urRKaMFU9LhdgA1fYmQ@mail.gmail.com>

Hi,

On Mon, Sep 21, 2026 at 11:22:06PM +0400, Semyon Fedyukovich wrote:
> Hi Guenter,
> 
> I read the public build pages of your master run for v7.3-rc4 to see
> how long a full build/boot pass takes and what bounds it. I would like
> to check my reading with you before I do anything with it.
> 
> What I read: 57 builders on 6 machines, 158 builds plus 608 qemu
> boots (about 696k KUnit passes). The buildcommand steps sum to 23.0
> hours; the run took 3h52 from first start to last end. Each machine
> ran at most two builders at once, so the farm has 12 slots, yet on
> average 5.9 steps were in flight (peak 10). Busy time per machine
> ranged from 138 min (jupiter) to 231 min (mars). The longest groups:
> powerpc 80 min, x86_64 80, qemu-arm-v7 78, arm 77, i386 and xtensa
> about 61 each with a single build reported.
> 
> Replaying those step durations as independent tasks:
> 
>   one slot                                1379 min
>   your run (12 slots, pinned builders)     232 min   5.9x
>   12 slots, any task on any free slot      118 min  11.7x
>   24 slots, same groups                     80 min  17.2x
>   24 slots, one task per config             61 min  22.5x

That is pure theory: The machines do not have an endless amount of
CPU capacity. Builds don't get faster by adding more builds (or
slots, as you call it) to a machine. "mars" is still "only" a
system with an AMD Ryzen 9 5900X CPU. The systems are for all
practical purposes fully or almost fully utilized with two parallel
builds or three parallel qemu emulation runs.

>   more slots                                no gain (longest build)
> 
> So with the hardware you have, free placement alone would roughly
> halve the run; doubling the hardware gets it to 60-80 minutes.
> 
> Three things I cannot tell from the pages:
> 1. Do step times include waiting inside the scripts? i386 and xtensa
>    both land just over an hour, which looks like a cap or a lock.
> 2. Is the builder-to-machine pinning deliberate (toolchains, machine
>    speed, qemu versions)? If so the 118 figure is not reachable.
> 3. The run started at 00:00 your time, about ten hours after the tag.
>    If that schedule is deliberate, faster compute may not matter to
>    you at all.
> 
> Why I ask: I maintain dispat (https://github.com/yohimik/dispat), a
> release tool whose next version places build and test tasks on worker
> machines over plain git: no daemon, signed task branches, and build
> outputs verified by digest before a dependent task may use them. Your
> matrix is the cleanest real workload I know for it. Nothing of mine
> has run against the kernel yet. If a shorter turnaround is useful to
> you, I would prototype it on my own hardware with your public
> linux-build-test scripts and send you measured numbers, not
> projections. If the limit is people reading results rather than
> machines, tell me and I will drop it.
> 

Let's see ... first of all, as you noted, pretty much everything is public
at github.com:groeck/linux-build-test.git. I had not updated the repository
for a while, but I did that now, so it is current. You should be able
to find answers for most if not all your questions in there and in the
buildbot code.

There are no intentional "pinned builders". The system uses an older
version of buildbot which has its limitations. Maybe the configuration
is less than perfect, but either case "pinning" is not intentional.
There are some restrictions - for example, a single machine can
only test a single qemu architecture at any given time because there
is only a single checked out qemu tree per build machine. That should
only affect bulk stable release builds, though. I suspect that the
buildbot algorithm selecting the next build is less than perfect,
but I never spent time trying to track it down.

Either case, I never spent time trying to update the system to a more
recent version of buildbot, simply because its architecture was changed
completely, with limited guidance how to convert older configurations
to new ones. I am not sure I understand what you are suggesting here.
Replace buildbot with your system ? I don't immediately see how that
could work because result analysis is deeply built into the system
(see schedulers.py and shellcommands.py in the code). I most definitely
don't have the time to update that or I would have converted it to a
more recent version of buildbot or to something else a long time ago.
Feel free to try, though - I am not married to buildbot and I'd be happy
to replace it.

Build time start and coverage is limited to start at midnight due to the
nowadays outrageous electricity cost in California. The build systems
consumes ~300-400W of electricity while idle and up to 1.6kW of electricity
while active. I used to run the system more actively, but at 1.6kW it
consumes more than 1,000kW of energy per month if running all the time.
Imagine how much that would cost me when paying $.36 ker kwH at night
and $.59 in the late afternoon for electricity, even more so when adding
AC cost into the picture. We do now have a fancy new solar system which
covers most of our electricity cost, but running the builders more actively
would immediate get us back into the world of outrageous electricity
prices.

Hope that helps,
Guenter
