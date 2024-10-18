Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529D0205AA5
	for <workflows@vger.kernel.org>; Fri, 18 Oct 2024 19:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729280699; cv=none; b=m6r1A2KbUsNRw4SnauPqaCM/SBp0uZEOEFTT0VGW/NZOorltwJGjFzLbRYBMM5DQ5zD0Q80LISRawu3unmD3WvAOwqDenCN/bY3MVFXudF9tfPhUAQLyy20QEYVvD3JE9TuCobYw9zp78zK3MOH5FmWK+4xeUm1NxFhsJHn5CiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729280699; c=relaxed/simple;
	bh=B0fFMKhNbuqDZoHJBiWLGHi1z3V4oDnsO+KS8j6pNKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rbp2vw7aWszRlQIKK/shPaXklw8xTtFKRSXn+sXnisgOCKCv299JUS9gbtj7QIysnRH1sCMgVcIn8TUqRdv5l2EzLwaVYafOJoWo7UR1up/eUbbqgEmotYQnrWbx4v0LSwMj0g/Xhsvt6CLexROXliYqzIybVtGxc647EcCBBe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hjQeZjyU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hjQeZjyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729280695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFvsALm5YCiL3LKUWB4AcUTCotBlIIKOVSJtrcQWWzM=;
	b=hjQeZjyUrI1U9QEF9JfCSzrrADNS3Hojzo7H5toXn3GtzIKPivqHUrOV68uJmZKKLXRIbI
	lpoI2vaU7PnBdOlry/VHBC84iuV6uuVanAnNGTSuFzyq5s7oeOIaLM5uKGV9dNJVuTygWL
	qhpzQGa+Jacmm/752KCetpraQyOxnGI=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-yOuR-K0mNUGcZmWi8d3yPw-1; Fri, 18 Oct 2024 15:44:52 -0400
X-MC-Unique: yOuR-K0mNUGcZmWi8d3yPw-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6e35bdb6a31so50739887b3.1
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2024 12:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729280692; x=1729885492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFvsALm5YCiL3LKUWB4AcUTCotBlIIKOVSJtrcQWWzM=;
        b=PAhosk2apZjxTgr5Y+YmXHjVbylJd36cqDejBhPqR/yQ0c+sGbAcg4iNTq+do6BxHK
         eSgkTRuzwjLOU1DKSmZ1DmjghhmzKk26+5r2MASRyNRCVs5yD06btKrSisRK8qiG2ztG
         9GHRA92hfdwVGiqpUqsUlx/MHZ4I4J5fmJ6xm78W4cpB+ehK0eUBYoJtmyQyim0j3z9e
         KjmNZ3azkCYCICps6lBSRj+tXqrVunL0KBqIYZUqXJ00w0szTCncTzPmmoveBToAJWIU
         nPaRz5V7ebUgKMhf74VkGucl2gM6IDBrHccqI7ydCXp4BsbCfKWT6LKGyI+qntZ2m5NS
         0iMA==
X-Gm-Message-State: AOJu0Yy1hPLapvMQo3NUCraj0nHxkAeUqLzOrIKJFW3HDBZf6AQXyXPW
	ZTwwHjPgV8JuLm/6RqCvh6c3nMQbdqWDc8qJvVrUNmZTh5ZH1cd5V/ONpqLzcmJ8pIWPnZcu5lZ
	2DsfcmXczeHbdyTqcP1lhsSeju6O1OI9Gcnb7VCqQQ+Smc+u2t4d7WWoD4LwkdrWc2LkDAGdYr4
	qlQT2nTEMZO9l8sBF6o5qqxAeWmGVBxECM
X-Received: by 2002:a05:690c:397:b0:6e2:71b:150 with SMTP id 00721157ae682-6e5bfd5cbc8mr39849207b3.29.1729280691945;
        Fri, 18 Oct 2024 12:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRhiwc/SE/JVdk0S5TJDlZe0DnE8KDUt6k6gVzKW/1/oCB1bfmPF+aF3mIB9O9zWG5Pj3xPWNUI0wZHEVp4ys=
X-Received: by 2002:a05:690c:397:b0:6e2:71b:150 with SMTP id
 00721157ae682-6e5bfd5cbc8mr39849007b3.29.1729280691517; Fri, 18 Oct 2024
 12:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK18DXYitS7hL1mA3QsPLmW9-R0q6Kin0C5Uv9fj=uS90WSnxA@mail.gmail.com>
 <6366eab3-4318-7b8b-686e-f9d5d320badb@ti.com>
In-Reply-To: <6366eab3-4318-7b8b-686e-f9d5d320badb@ti.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Fri, 18 Oct 2024 15:44:40 -0400
Message-ID: <CAK18DXZEwKv0ie=Jgb+n5dD+2nUwQHZrhCAFav5_t9+Sbmh2LQ@mail.gmail.com>
Subject: Re: [RFC] Test catalog template
To: Minas Hambardzumyan <minas@ti.com>
Cc: workflows@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	linux-kselftest@vger.kernel.org, kernelci <kernelci@lists.linux.dev>, 
	Nikolai Kondrashov <nkondras@redhat.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, 
	kernelci-members <kernelci-members@groups.io>, laura.nao@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 8:32=E2=80=AFAM Minas Hambardzumyan <minas@ti.com> =
wrote:
>
> On 10/14/24 15:32, Donald Zickus wrote:
> > Hi,
> >
> > At Linux Plumbers, a few dozen of us gathered together to discuss how
> > to expose what tests subsystem maintainers would like to run for every
> > patch submitted or when CI runs tests.  We agreed on a mock up of a
> > yaml template to start gathering info.  The yaml file could be
> > temporarily stored on kernelci.org until a more permanent home could
> > be found.  Attached is a template to start the conversation.
> >
> > Longer story.
> >
> > The current problem is CI systems are not unanimous about what tests
> > they run on submitted patches or git branches.  This makes it
> > difficult to figure out why a test failed or how to reproduce.
> > Further, it isn't always clear what tests a normal contributor should
> > run before posting patches.
> >
> > It has been long communicated that the tests LTP, xfstest and/or
> > kselftests should be the tests  to run.  However, not all maintainers
> > use those tests for their subsystems.  I am hoping to either capture
> > those tests or find ways to convince them to add their tests to the
> > preferred locations.
> >
> > The goal is for a given subsystem (defined in MAINTAINERS), define a
> > set of tests that should be run for any contributions to that
> > subsystem.  The hope is the collective CI results can be triaged
> > collectively (because they are related) and even have the numerous
> > flakes waived collectively  (same reason) improving the ability to
> > find and debug new test failures.  Because the tests and process are
> > known, having a human help debug any failures becomes easier.
> >
> > The plan is to put together a minimal yaml template that gets us going
> > (even if it is not optimized yet) and aim for about a dozen or so
> > subsystems.  At that point we should have enough feedback to promote
> > this more seriously and talk optimizations.
> >
> > Feedback encouraged.
> >
> > Cheers,
> > Don
> >
> > ---
> > # List of tests by subsystem
> > #
> > # Tests should adhere to KTAP definitions for results
> > #
> > # Description of section entries
> > #
> > #  maintainer:    test maintainer - name <email>
> > #  list:                mailing list for discussion
> > #  version:         stable version of the test
> > #  dependency: necessary distro package for testing
> > #  test:
> > #    path:            internal git path or url to fetch from
> > #    cmd:            command to run; ability to run locally
> > #    param:         additional param necessary to run test
> > #  hardware:      hardware necessary for validation
> > #
> > # Subsystems (alphabetical)
> >
> > KUNIT TEST:
> >    maintainer:
> >      - name: name1
> >        email: email1
> >      - name: name2
> >        email: email2
> >    list:
> >    version:
> >    dependency:
> >      - dep1
> >      - dep2
> >    test:
> >      - path: tools/testing/kunit
> >        cmd:
> >        param:
> >      - path:
> >        cmd:
> >        param:
> >    hardware: none
> >
> >
>
> Don,
>
> thanks for initiating this! I have a few questions/suggestions:
>
> I think the root element in a section (`KUNIT TEST` in your example) is
> expected to be a container of multiple test definitions ( so there will
> be one for LTP, KSelfTest, etc) -- can you confirm?

Actually I may have misled you.  'KUNIT TEST' was an example I picked
out of the MAINTAINERS file as a maintained subsystem that folks
contribute code too.  Well it was the example folks suggested I use at
plumbers (from what I recalled).
Inside the subsystem container is a 'test' section that is the
container of tests needed for the subsystem.

>
> Assuming above is correct and `test` is a container of multiple test
> definitions, can we add more properties to each:
>    * name -- would be a unique name id for each test
>    * description -- short description of the test.
>    * arch -- applicable platform architectures
>    * runtime -- This is subjective as it can be different for different
> systems. but maybe we can have some generic names, like 'SHORT',
> 'MEDIUM', 'LONG', etc and each system may scale the timeout locally?

Based on what I said above, does that change your thoughts a bit?  In
my head the tests are already out there and defined, I am not sure we
can request them to be unique.  And the description can be found in
the url as I envisioned some tests being run across multiple
subsystems, hence minimizing the duplication may be useful.  Happy to
be swayed in a different direction.

I like the idea of a 'timeout'.  That has been useful for our tests
internally.  I can add that to the fields.

>
> I see you have a `Subsystems` entry in comments section, but not in the
> example. Do you expect it to be part of this file, or will there be a
> file per each subsystem?

Hopefully my above comments clarifies your confusion?  The subsystem
is 'KUNIT TEST' in this example.


>
> Can we define what we mean by a `test`? For me this is a group of one or
> more individual testcases that can be initiated with a single
> command-line, and is expected to run in a 'reasonable' time. Any other
> thoughts?

Yes.  I was thinking a test(s) is something the subsystem maintainer
expects all contributors (humans) or testers (human or CI bots) to
that subsystem to run on posted patches.  The test is expected to be
command line driven (copy-n-paste is probably preferrable) and it can
consist of multiple test command lines or a larger testsuite.  Also
happy to be swayed differently.

Interested in your feedback to my comments.

Cheers,
Don

>
> Thanks!
> Minas
>
>
>

