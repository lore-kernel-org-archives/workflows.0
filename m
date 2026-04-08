Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633583612F6
	for <workflows@vger.kernel.org>; Wed,  8 Apr 2026 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649957; cv=none; b=kMdMjnsbaR14iymR6ihgZORA9EGCXHGXQNyNsUtWk3bsKlpzoqt3Dk+6ZD63GCyvypb9K2WbRsm51BsyaZlyyLDnf79OaBDJPFRpaqL/jOxZwsRWXejljLPnNNZqFFgbzZlllFdTyZr4Hzl0DO1pvVKRnfccw+4gea2sUPjEqsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649957; c=relaxed/simple;
	bh=8scfsOfxjJCA7PsheVSzcMVVAN4HZJ5wygd7fo905BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vy6eYkElWwiI1XprWr868PMy9NhkOus+uivmRgsO+0KeyaXM9jz7yjZNmoNK4zvsarnSrXm6RD2GkBZlWzVb41swx/fS4XWL9+CEU4Bt1H8tKR6/eHm9USm3ccC46H8iQslHq9YAm7qzYXUweoQVl2+V6h7mOmsvf4xifLp9V4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-953b7d2c820so1915483241.3
        for <workflows@vger.kernel.org>; Wed, 08 Apr 2026 05:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775649955; x=1776254755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGRbYznGbDw7bAVfW0akDmACi6u2DoC61pG2AP+p98k=;
        b=RPvXrozyp36tMnKvuTjwyFaLfvebEiILeS1oQzx5+38Qm7E1f90YW5oU3LU+NRCQgP
         +2feq3pr5at5AYq/zxtP9JfzORBISbowoEQLs2HfkJz6c4HfxG0qmZRUtLu7fAGVo9rD
         e3qGpa8dSeCtybkObMepx43Z+3Q38tCTbhRVzo6cMLA8AFGYqG0QZxOA1DrC7Dil8Qqx
         RpCeC+PKYKEC8ru6819IRh1uSLpyYwpZHsekBl3LWkaMzHJKhEXBtotCdLEyk6SVFVvR
         sP+umN+em4hZw2r5vLTLNVbE2iLpT7Ar3Bgd8GdwEPbfvlYgAFzHPmcXzOotwvPgoyPQ
         2jrw==
X-Forwarded-Encrypted: i=1; AJvYcCU9IoY+CbamrhNUACdRec2v7C8bS2dnVSykuFHyavf3J+7vTehW/7gwQtwxGGqc9rDVOiWWMJuKn3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTzOOSOUHj1fTr8kXblqivfd+biEM5YAoo19mQa98wZNuAbpMo
	QxuXqSD6FE/fZQy5nu/YAaGJHdlggphYwPTxW4q3CpfMt8k9Dq7xBjZXMV9EIvav
X-Gm-Gg: AeBDievuOV/HcveJUWFds6TQUuwXrL861SLrPL/ymBDgmzNJhQMtKJnNjtFY6UvRVG6
	TBxi8ntKx4PjQXEqDaeHVvzpKv0OgFMN6gdCTRTew5QgKl5vVdRzVwk2AOwauZiCmPx2dUnaSq0
	PueN1T0rgeBPCMYQcKbJzaHDZqZRzizSkPjjyIbFXOeT4O1Rsl784r1sFlD0c4BhxytwWXbFlCZ
	JoYUMKJDQQG05fYpiWK7A+62vo+EK+Z0novGtjGxLVihz7QfHStGTI8hffStfdZveEiiOAQwXcD
	/8Wd8yemMBf4WnivsfWoEbif67qgZft/t1WiWoBWsXjgEhyOMzoaNVVDkBiEB2Yi/xUa5y2otdN
	I2djWZPSpPDx7rNHNIXxzRti7rXhgEwpX5UaRnE4AYpyppQfsUfuEpHk3Rx6sZjJgTHaWRqhBo2
	NI682WutxZOn9CDnOj8ZJN01zzYyeD+Hh147Q7mMPf7SZaLArh+P2qAENKrn72zudmgUjH0zVUP
	zg=
X-Received: by 2002:a05:6122:4b05:b0:56d:3b69:87d2 with SMTP id 71dfb90a1353d-56dab9df26emr8543855e0c.11.1775649954902;
        Wed, 08 Apr 2026 05:05:54 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm15657860241.7.2026.04.08.05.05.53
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 05:05:53 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so1843874e0c.1
        for <workflows@vger.kernel.org>; Wed, 08 Apr 2026 05:05:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKIME1EuwZ+KXCwKEXRdtBunIxKgFvVMcDgbqxX/1Y5unZvXw3+rKnwrAnixQtl/80RoxmkcmhHKI=@vger.kernel.org
X-Received: by 2002:a05:6122:3784:b0:56d:92dd:a0ad with SMTP id
 71dfb90a1353d-56daba970e8mr8020585e0c.15.1775649953503; Wed, 08 Apr 2026
 05:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313150928.2637368-1-sashal@kernel.org> <20260314111822.63a2ba4a@kernel.org>
 <abZTg9ZwnE5J4qXa@laps>
In-Reply-To: <abZTg9ZwnE5J4qXa@laps>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 14:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5Ga9WCzD8ji8kgOMmosS+uzf_8mp_OkhFdcAg2=3KAg@mail.gmail.com>
X-Gm-Features: AQROBzA3VNDAkN7JQ2RBFKXcNeNTnnQqU_cNeGRDhYiY7nC0FR4lVKTSqS90qsM
Message-ID: <CAMuHMdU5Ga9WCzD8ji8kgOMmosS+uzf_8mp_OkhFdcAg2=3KAg@mail.gmail.com>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, tools@kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Dmitry Vyukov <dvyukov@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, Jake Edge <jake@lwn.net>, 
	David Laight <david.laight.linux@gmail.com>, Askar Safin <safinaskar@zohomail.com>, 
	Gabriele Paoloni <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sun, 15 Mar 2026 at 07:36, Sasha Levin <sashal@kernel.org> wrote:
> On Sat, Mar 14, 2026 at 11:18:22AM -0700, Jakub Kicinski wrote:
> >On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> >> This enables static analysis tools to verify userspace API usage at compile
> >> time, test generation based on formal specifications, consistent error handling
> >> validation, automated documentation generation, and formal verification of
> >> kernel interfaces.
> >
> >Could you give some examples? We have machine readable descriptions for
> >Netlink interfaces, we approached syzbot folks and they did not really
> >seem to care for those.
>
> Once the API is in a machine-readable format, we can write formatters to
> output whatever downstream tools need. The kapi tool in the series
> already ships with plain text, JSON, and RST formatters, and adding new
> output formats is straightforward. We don't need to convince the
> syzkaller folks to consume our specs, we can just output them in a
> format that syzkaller already understands.
>
> For example, I have a syzlang formatter that produces the following
> from the sys_read spec in this series:
>
>    # --- read ---
>    # Read data from a file descriptor
>    #
>    # @context process, sleepable
>    #
>    # @capability CAP_DAC_OVERRIDE: Bypass discretionary access control on read permission
>    # @capability CAP_DAC_READ_SEARCH: Bypass read permission checks on regular files
>    #
>    # @error EPERM (-1): Returned by fanotify permission events...
>    # @error EINTR (-4): The call was interrupted by a signal before any data was read.
>    # @error EIO (-5): A low-level I/O error occurred.
>    # @error EBADF (-9): fd is not a valid file descriptor, or fd was not opened for reading.
>    # @error EAGAIN (-11): O_NONBLOCK set and read would block.
>    # @error EACCES (-13): LSM denied the read operation via security_file_permission().
>    # @error EFAULT (-14): buf points outside the accessible address space.
>    # @error EISDIR (-21): fd refers to a directory.
>    # @error EINVAL (-22): fd not suitable for reading, O_DIRECT misaligned, count negative...
>    # @error ENODATA (-61): Data not available in cache...
>    # @error EOVERFLOW (-75): File position plus count would exceed LLONG_MAX.
>    # @error EOPNOTSUPP (-95): Read not supported for this file type...
>    # @error ENOBUFS (-105): Buffer too small for complete notification...

The actual E-values are positive, so I guess you want e.g. -EPERM?

Note that the actual errno values are architecture-specific.
E.g. EOPNOTSUPP can be 45, 95, 122, or 223.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
