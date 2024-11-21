Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1611D79BE
	for <workflows@vger.kernel.org>; Thu, 21 Nov 2024 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732202906; cv=none; b=b/PJmjxzmA8Ssq7CDborqsdmlrfibszimmNNKmotzSLtm83jrV6e7FbhWSmG82+PmuNSCuBEy7sGpppdY1SOUDNu/ts5XuK4rNMoTEkbzwraOwMoK4BLUXRVmDipCQY8i8JwoayEes0KHKjRERgusCyxU7vMtJ1DzD3J+ebmfqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732202906; c=relaxed/simple;
	bh=AiQKPX0HhQDE8c0S4ykPBQmmz/wb/hL2HG+fnVGd1Nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mU2JrIPCbpFtqpCFTd+PpU7iHQB+kiYcLlWeQRas/HwQXFZhmTeMtl+C2tYCuDz1mCJMl9XyTCkiIM8PTeTAP22YzzsROt1z1UXMT1Q9AQbV6eGRKzfRQ7QZM0VKreI/VsAl+R/iiYbjNozCYqZe6xKB84YuwGwKQqv/+KwGMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Om7zKRdo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Om7zKRdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732202902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTlRncZxSzMTlrtP+dPEh1AXEBr3udpSzwQ7cYXWV6s=;
	b=Om7zKRdojivQjSuanbD+L3GONMobBxpTJkeHGUIsozwmW6XN1gL7fG0ufRXzLGiORvggxA
	wfGiptHdnqRPtA9c5+ETmjw8ghEZRZXtjocsXjpnqzjcGgK7iYt5GgGVrH6kmtT+gIgsQb
	aGglWQSB8bNzWHfbQPLHWFuThLNK6rk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-xJoCNry9PQOJVxTbw96LWg-1; Thu, 21 Nov 2024 10:28:21 -0500
X-MC-Unique: xJoCNry9PQOJVxTbw96LWg-1
X-Mimecast-MFC-AGG-ID: xJoCNry9PQOJVxTbw96LWg
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6ea258fe4b6so21725817b3.1
        for <workflows@vger.kernel.org>; Thu, 21 Nov 2024 07:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732202901; x=1732807701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTlRncZxSzMTlrtP+dPEh1AXEBr3udpSzwQ7cYXWV6s=;
        b=NOR+6Ux/V6X0tv8+osOWq1oeb372QI4LWvMZrX82Ai0Bm8A4qNWj7bNpNYwTNinlw6
         gVZLPXT+c5v/9f3VSY+skHAb5wX3C0ukFhnJwJmAnbq5bcKqtVdicXu62E9/nVvDARxD
         HJLBwXG7Tkh9KfzKJAu8AZr3Aw2cQbA8tcj+rx4LBMfdBi472c84FypTrOp8kSoREWB/
         f7vfA93Jn5/gR0HtnyWruBf9Mjxuc4UmYcy7tKm/rY/uL50PVpUdnpdfh88QhYZgLv8D
         wP5h2Gzt8IVN4q384X8roJ+lInbIOmYxc8WZW9miDsT/xqUswk9OIS3XaENEuwKOoRe0
         oehw==
X-Gm-Message-State: AOJu0YzYO0sVFJL7RJHg9XF/2tZhIJgSLADNLPVk6VdxUljjqpBZX/qF
	O7DcvPRhAXnA/xGaoVXTLqGOqad9ylzAwXbt2TQ05KmFu+24wnU/ZgrfsjLgoFVxk2SLAdIWAO/
	5tkIZdkHZLT9ayDgd+TRszI6znlaHAleWpm0Fr0M0YlVNZEzxtE/iVu4Px1v2rnqKfdd59BbBxE
	pseUcE95k6LE4nJXdsZDGcRtX5nBvRh6Hp
X-Gm-Gg: ASbGncsoFg1Xj+ZGyUfZ1PO2N86Y3dj00tyVM3YquZ+Mpa3im9GprKg3luIzpyMR7Oq
	8TI3q9XKhLFazviKe0BVwSiZP3hdypyo=
X-Received: by 2002:a05:690c:6307:b0:6ee:7f37:7107 with SMTP id 00721157ae682-6eebd124819mr78595937b3.12.1732202900624;
        Thu, 21 Nov 2024 07:28:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFleEZ0WGYzANLMhgAnl5eQUxFn8peiSsoWxkXdOvWn2DCAFwsWqoW6djwb3DqQGjxNJFmHIu5JqU28r8yrDE4=
X-Received: by 2002:a05:690c:6307:b0:6ee:7f37:7107 with SMTP id
 00721157ae682-6eebd124819mr78595617b3.12.1732202900226; Thu, 21 Nov 2024
 07:28:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK18DXYitS7hL1mA3QsPLmW9-R0q6Kin0C5Uv9fj=uS90WSnxA@mail.gmail.com>
 <CABVgOSk1ng46scbJc-3qPZUhkn+0KrZsFDe-UYnw0q-XksP_2Q@mail.gmail.com>
 <CAK18DXZtBdxQdYY06X+Q=vYybnkCLBQBioCLqvSfkYZ21jBSWg@mail.gmail.com>
 <CABVgOSkBF3fT5JdVCEpBRvO1V8ZgZ-dD7fvxcv7Rxb_XPcFNbg@mail.gmail.com>
 <CAK18DXZM7sapjOHcsOUAEn_+Q+bvFUtL-CNjEgq373gpWr7r-w@mail.gmail.com> <CABVgOS=ccEK2+ighe=7K3Ja-vH0=fthK4LgV0kHTuNCgO9JzzQ@mail.gmail.com>
In-Reply-To: <CABVgOS=ccEK2+ighe=7K3Ja-vH0=fthK4LgV0kHTuNCgO9JzzQ@mail.gmail.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Thu, 21 Nov 2024 10:28:08 -0500
Message-ID: <CAK18DXZCgRpS=kHgh9xGmjE9dO2s7Gm61m_yq8QUAZEMMUOEyw@mail.gmail.com>
Subject: Re: [RFC] Test catalog template
To: David Gow <davidgow@google.com>
Cc: workflows@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	linux-kselftest@vger.kernel.org, kernelci <kernelci@lists.linux.dev>, 
	Nikolai Kondrashov <nkondras@redhat.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, 
	kernelci-members <kernelci-members@groups.io>, laura.nao@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, Nov 20, 2024 at 3:16=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> On Thu, 7 Nov 2024 at 01:01, Donald Zickus <dzickus@redhat.com> wrote:
> >
> > Hi,
> >
> > Thanks for the feedback. I created a more realistic test.yaml file to
> > start (we can split it when more tests are added) and a parser.  I was
> > going to add patch support as input to mimic get_maintainers.pl
> > output, but that might take some time.  For now, you have to manually
> > select a subsystem.  I will try to find space on kernelci.org to grow
> > this work but you can find a git tree here[0].
> >
> > From the README.md
> > """
> > An attempt to map kernel subsystems to kernel tests that should be run
> > on patches or code by humans and CI systems.
> >
> > Examples:
> >
> > Find test info for a subsystem
> >
> > ./get_tests.py -s 'KUNIT TEST' --info
> >
> > Subsystem:    KUNIT TEST
> > Maintainer:
> >   David Gow <davidgow@google.com>
> > Mailing List: None
> > Version:      None
> > Dependency:   ['python3-mypy']
> > Test:
> >   smoke:
> >     Url: None
> >     Working Directory: None
> >     Cmd: ./tools/testing/kunit/kunit.py
> >     Env: None
> >     Param: run --kunitconfig lib/kunit
> > Hardware:     arm64, x86_64
> >
> > Find copy-n-pastable tests for a subsystem
> >
> > ./get_tests.py -s 'KUNIT TEST'
> >
> > ./tools/testing/kunit/kunit.pyrun --kunitconfig lib/kunit
> > """
> >
> > Is this aligning with what people were expecting?
> >
>
>
> Awesome! I've been playing around a bit with this, and I think it's an
> excellent start.
>
> There are definitely some more features I'd want in an ideal world
> (e.g., configuration matrices, etc), but this works well enough.

Yeah, I was trying to nail down the usability angle first before
expanding with bells and whistles.  I would like to think the yaml
file is flexible enough to handle those features though??

>
> I've been playing around with a branch which adds the ability to
> actually run these tests, based on the 'run_checks.py' script we use
> for KUnit:
> https://github.com/sulix/test-catalog/tree/runtest-wip

Thanks!

>
> In particular, this adds a '-r' option which runs the tests for the
> subsystem in parallel. This largely matches what I was doing manually
> =E2=80=94 for instance, the KUnit section in test.yaml now has three diff=
erent
> tests, and running it gives me this result:
> ../test-catalog/get_tests.py -r -s 'KUNIT TEST'
> Waiting on 3 checks (kunit-tool-test, uml, x86_64)...
> kunit-tool-test: PASSED
> x86_64: PASSED
> uml: PASSED

Interesting.  Originally I was thinking this would be done serially.
I didn't think tests were safe enough to run in parallel.  I am
definitely open to this.  My python isn't the best, but I think your
PR looks reasonable.

>
> (Obviously, in the real world, I'd have more checks, including other
> architectures, checkpatch, etc, but this works as a proof-of-concept
> for me.)
>
> I think the most interesting questions will be:
> - How do we make this work with more complicated dependencies
> (containers, special hardware, etc)?

I was imagining a 'hw-requires' type line to handle the hardware
requests as that seemed natural for a lot of the driver work. Run a
quick check before running the test to see if the required hw is
present or not and bail if it isn't.  The containers piece is a little
trickier and ties into the test environment I think.  The script would
have to create an environment and inject the tests into the
environment and run them.  I would imagine some of this would have to
be static as the setup is complicated.  For example, a 'container'
label would execute custom code to setup a test environment inside a
container.  Open to ideas here.

> - How do we integrate it with CI systems =E2=80=94 can we pull the subsys=
tem
> name for a patch from MAINTAINERS and look it up here?

There are two thoughts.  First is yes.  As a developer you probably
want to run something like 'get_maintainers.sh <patch> | get_tests.py
-s -' or something to figure out what variety of tests you should run
before posting.  And a CI system could probably do something similar.

There is also another thought, you already know the subsystem you want
to test.  For example, a patch is usually written for a particular
subsystem that happens to touch code from other subsystems.  You
primarily want to run it against a specified subsystem.  I know Red
Hat's CKI will run against a known subsystem git-tree and would fall
into this category.  While it does leave a gap in other subsystem
testing, sometimes as a human you already know running those extra
tests is mostly a no-op because it doesn't really change anything.

> - What about things like checkpatch, or general defconfig build tests
> which aren't subsystem-specific?

My initial thought is that this is another category of testing.  A lot
of CI tests are workload testing and have predefined configs.  Whereas
a generic testing CI system (think 0-day) would focus on those types
of testing.  So I would lean away from those checks in this approach
or we could add a category 'general' too.  I do know checkpatch rules
vary from maintainer to maintainer.

> - How can we support more complicated configurations or groups of
> configurations?

Examples?

> - Do we add support for specific tools and/or parsing/combining output?

Examples?  I wasn't thinking of parsing test output, just providing
what to run as a good first step.  My initial thought was to help
nudge tests towards the KTAP output??

>
> But I'm content to keep playing around with this a bit more for now.

Thank you! Please do!

Cheers,
Don

