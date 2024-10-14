Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9768F1D0F79
	for <workflows@vger.kernel.org>; Mon, 14 Oct 2024 20:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728937976; cv=none; b=sTOHXuUobsrF3gAxHNZ0rl1tJSOiZeb/ErQjpr1Y0CrtXd0eQZyyDSCiw0AE1zcMe7e3+KsbIvP8nUId7eLrHrj7gvS71dlptUw1/A5weJNmq/BIxHmBaVqBhDI0VOglBxG7muwduU2rdlwdWzbFaWH51f/Vy4KNYq9YGn9cDHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728937976; c=relaxed/simple;
	bh=I8SPlUf63OyKm61QgjAtJIGxNR068+dmheUm2cKrywc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NlNrHKCtmUqDmt/HhVY5jjIewKU3cEjA4dfE9xXeQef6Zp3mVRo5X81Log6zez7Tz0lxKA9/ow541w67KRGr5w0FLkjdl2nc5P0NFTQwMpTgUULvCPcLdP982O9hYA89k3LjrXOTlJsHT3XYfD7InjhODgbP5uHMoLJzx//IQgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LQAW7x5X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LQAW7x5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728937973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=rICH7gY+J+cXT0uk6GhkMD4lYgCJxm+vEVmSW1XPEU8=;
	b=LQAW7x5X3EYzmimlrfoNfVT7+tvr6f0vso6Sdn1vRwUluKBWzCU9S2CdPW2032w4kvIXtH
	oaSeM6EAjxoXCrUP3RPu/pgnBQwC4Dkt4dA4RBRukWHO+P/veXl88KvmEd0OdD08e7qYHa
	oHVWfrR1sMvRfEN3RygrkXe3a8heseM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-3xQTYl78Nl2iTR5oU5RvrQ-1; Mon, 14 Oct 2024 16:32:49 -0400
X-MC-Unique: 3xQTYl78Nl2iTR5oU5RvrQ-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-6e3529d80e5so37597047b3.0
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2024 13:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728937969; x=1729542769;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rICH7gY+J+cXT0uk6GhkMD4lYgCJxm+vEVmSW1XPEU8=;
        b=aYdEP8wqFYzW5KyA5Ja29Qg9cYjdJ74vodziXoZ2HCLuxIY3DxpbV+s6evf2TkZAR0
         JrhujR6ftiT5mvT2AGCePTzw6NL+DUla5dsvhiQp79Ad6eUxSnPMEe/bbRsR+H8STSor
         cmnLoxHpyYy74Dl9IH0Qcv/8Sh6O5zBlpQIGTzWGQA9QDdp3YRrnuvHoxCF/aFEcPpV7
         YqufPlkkUS6dAzNYb+uM54A1mV75MxfiFoGJICAjq/Wi0Y9PVhr52VlsPBOyKZBUCC3T
         R/TpwA8ETqsgvlLiMxzZPE1wmqectJXvPOb/bukuz0cvwhuvG7GQx/QK02Bhq/S+eXW2
         E/pA==
X-Gm-Message-State: AOJu0YxU3qeK9hVJeq4QXUXfbjHsBKQnm8lNQQ7UNPCmEL0EukBXQSBm
	VplHHmpYS/6ESrLx2KZUwqTTQw/AQzOM8ZqNTwy/BjaSHKRK8K2CyMQhQDnZQUY9LNxaeAmfhtR
	UR0k5wte+QUlYg3WkGCSuwkUiAgWZfia/kvFVYYk+Mpqd4LXnudhO7H4/B8ELJLEdU3YKdRcE1U
	DzpkG/eSXyGjK3GfUFio+9weBs5LHuGO6wzD9tbXLS
X-Received: by 2002:a05:690c:c0a:b0:6e3:1f02:407b with SMTP id 00721157ae682-6e3479b952emr104674507b3.11.1728937969276;
        Mon, 14 Oct 2024 13:32:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx06yBHTeiKFZ9L5RrQ9VF0zIcHvf14RARbncPs3uTJzudMbdRLRPqc1mw21CvffdCDexOqb30DJWFeQ7knCg=
X-Received: by 2002:a05:690c:c0a:b0:6e3:1f02:407b with SMTP id
 00721157ae682-6e3479b952emr104674407b3.11.1728937968878; Mon, 14 Oct 2024
 13:32:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Donald Zickus <dzickus@redhat.com>
Date: Mon, 14 Oct 2024 16:32:37 -0400
Message-ID: <CAK18DXYitS7hL1mA3QsPLmW9-R0q6Kin0C5Uv9fj=uS90WSnxA@mail.gmail.com>
Subject: [RFC] Test catalog template
To: workflows@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	linux-kselftest@vger.kernel.org, kernelci <kernelci@lists.linux.dev>
Cc: Nikolai Kondrashov <nkondras@redhat.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, 
	kernelci-members <kernelci-members@groups.io>, laura.nao@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi,

At Linux Plumbers, a few dozen of us gathered together to discuss how
to expose what tests subsystem maintainers would like to run for every
patch submitted or when CI runs tests.  We agreed on a mock up of a
yaml template to start gathering info.  The yaml file could be
temporarily stored on kernelci.org until a more permanent home could
be found.  Attached is a template to start the conversation.

Longer story.

The current problem is CI systems are not unanimous about what tests
they run on submitted patches or git branches.  This makes it
difficult to figure out why a test failed or how to reproduce.
Further, it isn't always clear what tests a normal contributor should
run before posting patches.

It has been long communicated that the tests LTP, xfstest and/or
kselftests should be the tests  to run.  However, not all maintainers
use those tests for their subsystems.  I am hoping to either capture
those tests or find ways to convince them to add their tests to the
preferred locations.

The goal is for a given subsystem (defined in MAINTAINERS), define a
set of tests that should be run for any contributions to that
subsystem.  The hope is the collective CI results can be triaged
collectively (because they are related) and even have the numerous
flakes waived collectively  (same reason) improving the ability to
find and debug new test failures.  Because the tests and process are
known, having a human help debug any failures becomes easier.

The plan is to put together a minimal yaml template that gets us going
(even if it is not optimized yet) and aim for about a dozen or so
subsystems.  At that point we should have enough feedback to promote
this more seriously and talk optimizations.

Feedback encouraged.

Cheers,
Don

---
# List of tests by subsystem
#
# Tests should adhere to KTAP definitions for results
#
# Description of section entries
#
#  maintainer:    test maintainer - name <email>
#  list:                mailing list for discussion
#  version:         stable version of the test
#  dependency: necessary distro package for testing
#  test:
#    path:            internal git path or url to fetch from
#    cmd:            command to run; ability to run locally
#    param:         additional param necessary to run test
#  hardware:      hardware necessary for validation
#
# Subsystems (alphabetical)

KUNIT TEST:
  maintainer:
    - name: name1
      email: email1
    - name: name2
      email: email2
  list:
  version:
  dependency:
    - dep1
    - dep2
  test:
    - path: tools/testing/kunit
      cmd:
      param:
    - path:
      cmd:
      param:
  hardware: none

