Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4D843B3D2
	for <workflows@vger.kernel.org>; Wed, 29 Jul 2026 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312123; cv=pass; b=b9V6tLH0Zk85qOghob7R7OipTimGeLvIho4V2LBDj1c3CiQqNhMyhFeMOfkV7BrSuYftIitu1NnHcpWLeYnWSLxAoMzkBisMz3KgYzMdNXNRwjQbHc4g5S33r/ZA+YyWiZRJcHwsr9jzgJYIfmc3jcN34ruqivzMxQzFPXXZ9ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312123; c=relaxed/simple;
	bh=E+d/wxfijpG5a03pesaWaRBShh6JdAWrTDqdnE//6u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pu5zYvHanEFy/KoEo0HBMRb2zRkloyURhbQMbZhH2BbHj5+E34RnG0ciLVWDRook1QrCRej36tPgSjH3XmcUGmlTt+mNxp3UsVmIRTt6klaM3X2iLsnnqSvK1D0IRiRpsVzzsUOJq/MS1Kz+5UX5mzDlI5nMKY4X6AS9M8PaLTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGAyz7Yb; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGAyz7Yb"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38deea72eebso698174a91.1
        for <workflows@vger.kernel.org>; Wed, 29 Jul 2026 01:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785312121; cv=none;
        d=google.com; s=arc-20260327;
        b=HpmCHqnRZQ9/obgn+k9stLK+B+5nlkln5jPYnhPMCUBnV68Xuyc29ZGHq7MT9MV6Da
         Zg1WvSik1hyo3j2eC5a0n4ct8gQcHD4jJ1gqkpG3aldkyAX2r76VrxWvrXxBD8Nx06aL
         bRpw/0mMVtr/Z1OJDA2whCVbKYGaaN1/1keD/K+5kAPrs/UySXjLUYfkel3xu06Jx3mz
         q/PEh1nzRGtwkvOohxUT9MxQpqNA5zT0V9DjzOofgLDv4lLWWmCCglvaphyOgCknnXz8
         z/Et4qNcSDT+A8+vy6z+8xaLl+B+OS806V4mgOt1J7Jkb8pEYvhoHXPSi5Ek9nvvR2Q0
         Z4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E+d/wxfijpG5a03pesaWaRBShh6JdAWrTDqdnE//6u4=;
        fh=djz0CvWrf5kJ4cXlNKEx711zI9dXowTOyWtiau+9G5E=;
        b=daOxHnVQQNs8qswHm57qprgXzX040XBph4ZfSibAbLcXDuImRbO1J1p3cvibm1n+ug
         1p41YrJfv7t5IdYR93iOgoyIacKUOW0UAJ7kGp7Lyi7QzuDhpxuJ0gb+prDG8JOGq4FB
         zso4EIS0TEXGuo0ksp9JF+7yKF9upm50eaHsVuzwZ2LVOd4e/GjI4d62yD5jQ6eqXDr2
         bQ46QyZVjpo8JL+oU2RkTiQW0IC3jSeV1qshTVCszaUJaIwgs0ONOXNqolbXWh8YDvJN
         3eJTgQs7UYbbt7HCDrloOImF0I1NFIfVDWHMDcs7xJBUK+XkimGiuSllJ75yRXuco3Yd
         nv5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785312121; x=1785916921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E+d/wxfijpG5a03pesaWaRBShh6JdAWrTDqdnE//6u4=;
        b=HGAyz7YbjqwQCS78HNN6+1yo41ZmDdgr6pTBGgLfkOrzFZGxXzI0Hu2a7N5iD0KI8H
         vqHEtS4SitZ8wh2t9qvw8dxajGHEokBRII13PaySxx9U6pR1Jz5DNBjOmbX/ZF0xR7oI
         bGa94NhPoyCCEwGLqTtxi509ZMPsIO46AYFnTJyfvDKfoly+fh/cnEAc3HWuSsZ3ECnO
         wDOCHpPbcKr2DiP5yxTWNSOMh7E3uTezROvHrWwCnl25NBmS7naORlUXzZjf64vmcLk7
         7LfCyVrOGhp8piWIfqFgUckPvNXGiFfIQG43GxCIxaGe8bzplhw5/ppkbhdk33ZdicFK
         vUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312121; x=1785916921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+d/wxfijpG5a03pesaWaRBShh6JdAWrTDqdnE//6u4=;
        b=AjT3H2fBV1uqbBu8Sf0o8yWB0MwqhR4swnFH8NwQKBnCrG4JshBi0fhlgP9RC6vyJI
         ugP/EBmjV5ACj/bXXXUwknWZupDN3GZH4/v6XRXK/MkBQ6OyDgtvWDI2wv6VSYhfCO8W
         Jnzui4ht1Rm7rNqMXE1E+jkKaUtrVvzZ/8Oirmy6KTQ4rQb4HdYCu1coHxb11bkE9Inb
         VfUPHl0KIx6+8xbNjR94tILB5vszeApv1OQepukwajgczsM1nKze9Sd3kzR2Y03pvORm
         7+/yjKnBBfEfY7R08xHDarI3Taoq8yiZJJo6j0j1xduAk9BqMDFT/LQPLwHt305oMITU
         ZCJw==
X-Forwarded-Encrypted: i=1; AHgh+RppLkJr1FFTZ4xPh0ErOlFwO/On+m+hfLDZKTevXpN+8q/WFYxYEf9IdPoLFs12NjayWFLYvrDWt70=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWDy+Ae8O+/vU6cpSd+OSjvjYF4UVQBtIvyE0NNb/f6gGVX//
	q9iKIwgHYgdceuUCsfVB+o4eKDo27oBr+jKUWkKTAmVaJt1pgh4wi7dsPV+yiQ732KqfiO9wt+T
	8HcN/pf2NZogAOvmL+MYOZYCqV5KvWog=
X-Gm-Gg: AR+sD10wo/up6M9v/D2IXp7tGdHyH69y0c0o+d7GwTkpAF/DWh3WAURgJXBELVyXxXq
	isaItSUsRvFkeI15pag8yvBRaV286gqpeZuhuWCWUAivbIgnXtmxXnrS+nf4IFHMCSWinhLveIX
	gVo3j/LA8zrwNne1/vL8+b3G3YuVTY7aKmzEPBUO0CyiUHXztqXdx0F9wgCY17kEWL6ZjjIaP+Z
	7wfHDii+OMNC0q5G/DiwTwgcaFfZu+nk4rbY6CL6+5hB6RZUZY+UF/i9wF86X7fHu8+s3LeHHAT
	3wk4oSUvi7U5H+n3QkAVmR/LRRCet4c0FQygah3A2Uuj
X-Received: by 2002:a05:6a21:1f85:b0:3c3:9ed1:2563 with SMTP id
 adf61e73a8af0-3c8ba5c030fmr6542961637.42.1785312120646; Wed, 29 Jul 2026
 01:02:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728052442.626076-1-cihan.cihan@gmail.com> <20260728073143.0e665e36@kernel.org>
In-Reply-To: <20260728073143.0e665e36@kernel.org>
From: Cihan Karadag <cihan.cihan@gmail.com>
Date: Wed, 29 Jul 2026 02:01:48 -0600
X-Gm-Features: AUfX_myTsB4DNkHmtassqq87MW8r-GiqBz-oPHH4kRzi-QYYRJCIYHJb-nKGroQ
Message-ID: <CA+JfJhbda3VbLcAO9KEPgJVH-3WwVvJjdgh0MQUH=Fhnsp28iw@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: warn about possible missing gitignore
 coverage in selftests
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 8:31=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 27 Jul 2026 23:24:41 -0600 Cihan Karadag wrote:
> > Per selftests documentation [1], every generated test binary must be
> > added to gitignore to prevent leaving untracked files in the kernel
> > tree.
> >
> > This is an easy mistake to make when adding a new test. In fact, a
> > search of selftests history turns up dozens of standalone follow-up
> > patches with titles like "add missing gitignore for <binary>", each
> > needed only because the original patch adding a new test
> > didn't also update gitignore.
> >
> > Add a SELFTESTS_GITIGNORE check that warns about gitignore coverage
> > whenever a patch adds a new file under tools/testing/selftests/, the
> > same way FILE_PATH_CHANGES warns about MAINTAINERS on any added,
> > moved, or deleted file.
>
> What percentage of changes to selftests from last 2 releases will
> false-positive trigger this? Would be good to know, checkpatch has
> a tendency of generating false positives which is quite counter
> productive.

It will trigger whenever a new file is added to selftests, which has
a chance of introducing a test artifact into the tree. I checked the
last 20 commits touching selftests and only 6 of them were new file
additions, so this warning would have fired 6 times. Actually, one of
those 6 had a missing gitignore entry that this check is supposed to
warn about (fuse_acl_cache_test, 9acb102522b9).

Comparing to other WARNINGs that checkpatch generates, such as
FILE_PATH_CHANGES which has existed since 2014, this seems like a
reasonable and already accepted way for checkpatch to operate.

For comparison, I checked the last 20 commits that triggered
FILE_PATH_CHANGES in the tree, and none of them actually needed a
MAINTAINERS update.

> In netdev CI at least we build the selftests and check
> if there are any untracked files after.

That is a good practice. But as evidenced by commits already in the
tree, this type of coverage does not exist in all places.

Since this is a mistake that is frequently made, I think it deserves
a warning on its own. In the end I think it is acceptable that this
warning fires more than necessary, the same way FILE_PATH_CHANGES
does, because the cost of an extra check is low and the mistakes it
warns about are easy to miss.
