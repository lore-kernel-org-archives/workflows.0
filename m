Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470043101C5
	for <workflows@vger.kernel.org>; Tue, 14 Oct 2025 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443105; cv=none; b=S4T5Gql8P8Abp2ZEmkh27vhdCupk59NDaak68l3uvAB7prtFIQS6LRMzlgh+zkqss7NahKh0+yLjjvjpA7GZhNs1ErOlgqUHtT1BZo18FM+z0l4XBvCNZ6U+malMG/tGP9mtvHRQI1XQdSPQL2lxLDOg+vxokcJN3AKkso9GlNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443105; c=relaxed/simple;
	bh=DQcppO9zbJMHem9XFygkT9zl07JxR8H/tW98+lITK5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMCjpUMnaKRtVySBTYOKKeOGtgz5438jkhJPAjIXAm0/EIA7yiBABEAOD6k8KarKHjxvpAx+seU2vvOHcgmEImXzG537WNMdDED5QGVASQ8FtkSYpmpCBj5FAcZ4zItNBqkN+1Kl2RmPgW+1pNQDktu/kl0aw3wqSL5i2RiejqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7dsIAIt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7dsIAIt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27eda3a38ceso11210395ad.3
        for <workflows@vger.kernel.org>; Tue, 14 Oct 2025 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760443103; x=1761047903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTrmlwTskkr/kKbtRF4NeJMF7KiXf++loWOpKi8ycAY=;
        b=b7dsIAItY4gKDfQg67Efq1AldwSQI6NZEMB19v0zbJ6gjd/+JDeIyheiwqHyHaypue
         SntzSrEaStlXrHpSNK5v6vsMNDyeULq3Fl3jv7Z4cUX3cbjUzduXwk03BoZYnMAoGVLD
         F0kAPlQGDX4eudmUiXWFnKIVhvG7S7ZDy7MEvJcSgZFp8lDprVg1dXOrw/0Ix6d+URnh
         +saOq3L7/resApOtTNGMJkS1liYfPxL7LBO4o1LN0AWNhfL9wAArXtpq55xDS/2blP7D
         QuNanCKm4BHNktSkj9hplv5lEkg20WO0ezK7n1sDVjUkIxh+tBtkWC5VYqm3KiDRGheQ
         /cnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443103; x=1761047903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTrmlwTskkr/kKbtRF4NeJMF7KiXf++loWOpKi8ycAY=;
        b=rxkvJcTFHhlrxZ7pSDGA8gLinKe9BKpG7nyRAJmOnWbxNOC3fhG5U3aYtygcG+GrFD
         6PBh5zLarTfEIoew2tF7KziFatLPMr3A+YC/S+rjRhz33UakX3OgRkqHJc08dFNWlNf9
         yAQ3DRMWHcW9s5TtZD0VEnUQ5X8lWgnUQ0vB7hTvSozE70vpPw5Mi56OBWbszm0lxEm5
         6QpTDJamf5embBGFyKV18Cg9eIJNm8oIDQHGnVni82AumwkCtdtbDFmcW9CSgizeVh7q
         dqgQf0hSkH35g/27qbpkxNlOi5WmWBGtQwGXPIKepMgG3DmWaaVCX7S/CRIBR/87QD3c
         0sYA==
X-Forwarded-Encrypted: i=1; AJvYcCV7KVKpi/o2tZ/BwjmJ3KaCB/MevQKi/oBYU+Isy8lSQXsGJHgI2JCLJgiYwYX3gIGtWC/OZOTO6nI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcGdLyt6wJGGBwOe5OhKsDDvLRjP8eYqGOGL1E3G3LRIOh8A+I
	P5QCKyfuruzsT5v4X51ZKs2rZX9PZLqP/USjE0qTBNRh1yU+iB2QdinSBg0ZcZrXZT13ywc/OyT
	eWAG7nGTjCk24eSNbdbRDA2atrl2Bds4=
X-Gm-Gg: ASbGncslCPuUBO6VpcVQyZI2ZZlmHBNlCbRNUHLbMQSNEEhP7TUDIEGQbioWfKFkKz0
	XgHNczoVd4wgdLKMXahQ1IxkPN7ivw8T5fynY0bC3ywzP8R6Tawi9bYsaKnCTAEwlCva2LPXViM
	1fzAuPIAPFZ5MU772Q5OAkXgozh5600qIh7r5Uy9uMh9n2Duf9tOJw4aIBJzE/cNNbl8bILvj5z
	6nbaDgWSKYH8J/XeBIxN8VdPmhlcH26TN0Da+jD3Sd1phG1rzTVHaq5UCyS6zwtr4l3Vb0ChlNn
	kMnlROYcNHg4YAiLDVMrEfxDBb7toSKAc7vkt/eQYWt8rVbxvt/D8NA=
X-Google-Smtp-Source: AGHT+IE5mD/OqZwnZKBsKCjL4XqIp9LWIF2r4C8a99CzvazlBr1ZWoDhjbQJXYRKSAmFGV4Ksc8hZ5kDX58X7OqE8yE=
X-Received: by 2002:a17:902:e849:b0:27e:e96a:4bf with SMTP id
 d9443c01a7336-290273c6246mr201519995ad.2.1760443103387; Tue, 14 Oct 2025
 04:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014094511.627258-1-gtucker@gtucker.io> <20251014094511.627258-2-gtucker@gtucker.io>
In-Reply-To: <20251014094511.627258-2-gtucker@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Oct 2025 13:58:10 +0200
X-Gm-Features: AS18NWDBj5affi_lUiES-5b_WCz6GVsApMNcuTw9-KEiFct1NPsDYKVQGOwC3Bg
Message-ID: <CANiq72nVxPY8xB9xEnkZ=zNFh0EfQvaMAPH4ygRr-yEwpK=OWg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] kbuild: add Makefile.container with CONTAINER option
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org, Arnd Bergmann <arnd@arndb.de>, 
	workflows@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 11:45=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> Add scripts/Makefile.container to wrap the make command in a container
> using the CONTAINER=3D variable to specify the image name.  For example:
>
>     make -f scripts/Makefile.container CONTAINER=3Dkorg-gcc defconfig
>
> The container image name is entirely arbitrary and the container tool
> may be Docker, Podman or any other compatible alternative specified by
> the CONTAINER_COMMAND variable.  The default is set to docker for now.

IIUC, this wraps reruns `make` inside the container, but it means
hardcoding a particular tool and path, right? (unless one sets even
more variables)

The cover letter says one can create an alias for this, but one could
also do that for the underlying call anyway, unless I am missing
something. And if we do this, then I would prefer one doesn't need to
type `-f ...`.

Put another way, for a user, what is the benefit of having this extra
way of running in a container? For instance, I could see the benefit
if different tools had different flags or it was a complicated
procedure, but I think at least `podman` shares the flags used here.

Should this instead be a document inside `Documentation/` somewhere
that explains how to do this, pitfalls, advanced options, etc. and
give example command lines for different tools?

If we do end up with `CONTAINER=3D`, then I think it should make it work
without having to pass `-f ...`, to make it easier. Or, even better,
like the KUnit script, we could have a script that does the right
thing and reads a config from the user, so that one can just type
something like, picking whatever tooling the user configured (e.g.
Docker vs. Podman, default image, etc.):

    scripts/container.py defconfig

Thanks!

Cheers,
Miguel
