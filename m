Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8884035C0
	for <workflows@vger.kernel.org>; Tue, 24 Mar 2026 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365147; cv=pass; b=l/Fdcs0OB4lqUDzWFL1TbbUeyR/mge2wpX0V0iP7qv+QAcaXNkGB69y8wAfNVBJpmpjdZu6kYNYtUnPtbVellYyTpeZo23k7APwJPFkvlP5/ePTB+ti4te5RarBxv6ylOBGsBExgay2Szz839LLw0HBF1jrWRpWZXsGMRiS/j8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365147; c=relaxed/simple;
	bh=DkvA0f0R1I6yYwVuzVRz3vdcNRxquFRNpQPJVodbTWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxaBAhoAQ6/O1/Ba29fnitCduC/igOjqzIn0QIyBwla1WzN1JOSOP1QwCsMJeR1DkYf7vZYLvbeA1f0QeJp+v/LirgUzrgfFRO73j2rS+0hFW/TuC5bEfUQZx7lzGCWnjX6d49opMUR5sOW0njcBO7ZLhu2eWkNKCB0sLqAh3AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7rIUCpN; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7rIUCpN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so35114965e9.2
        for <workflows@vger.kernel.org>; Tue, 24 Mar 2026 08:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774365144; cv=none;
        d=google.com; s=arc-20240605;
        b=gXhIb6XQDjFhNFtTEtuAbq1X13drulprGrfQJAN3cx1tn8wfpFMw5J/v+7gRGiV+uA
         3Al1droUAkiWdIq0EZcjZYQ8JoOCeX0KsLtHrGBjKZqa5YL9DY+TVQFgsy1uv4Pj5+wY
         PmFx9YxXIjmSU7yq8vWD6O0SEHmvPo0DutUNltnrH+/VjQ/NxklL88N8if0dE+1kGqXk
         9cJvrRTuiDZyo9fTjDfzh3OXE74IAh6eCuXAsDv8ZKDxDGq15rM1HW8xRK9PeoMBmlm3
         ZC3AlWfhNg9vH5CsguAi5FRT+FUrh5mkruuxtx2q9/M2bZgwkrQvERPKQZjZAKW/Dzuj
         Jvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DkvA0f0R1I6yYwVuzVRz3vdcNRxquFRNpQPJVodbTWs=;
        fh=M8neFBixwDK5iJnxYal3tmTFPxI1OIDR/H1Oq1B7kqM=;
        b=JSumv2tyR+kNv7krfs6mQgR1mPmxI9ksRztbcSm7qa0x3N9ObR8YrMXsycBqjMjt7A
         U5JkCG7SkPTjfgWCe9pTX/vrSMVz7DojXXc6/ZICGs9kL05KmobDtuL6xmXJYONkUNFc
         vX6shIS9WWhl40Ttn/1H2iry/H+Zv+ZVrIFQMl5IvGRPvTncIzMSyByJbeyiyuTMRPo6
         /ZYDx+FaPRaxXLzwQbHvxwZ5D1VgyUN94rL5lp7nfbfczCCeMNLZjsykx6DfkyJBi1UC
         iacSZp2YFmeb9Z/1y2Q47Xx6zxt00lXhRaey3kbYyVc2XTBCTFSzFBtwrucHeM/+C5wo
         SedA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774365144; x=1774969944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkvA0f0R1I6yYwVuzVRz3vdcNRxquFRNpQPJVodbTWs=;
        b=g7rIUCpN58WhowYUjDPPlmNqt+6u6uR+cqQJIMUf56KJgn5f8cuIIPmFBTBWKMTk9o
         H8KFVnOV8gxYeX8cDgg2YgY2k0QGTPFci0+HeL0H7e82neTkmdFSRoAbNixhx4+5+eXa
         QAQguesxRw8k7uueqqu0EE4JtAdpfCv4iW0Suu6JKZrZUSVxzkVyZaEhE+gfpF533mpo
         Xjc9dOz//GKSYX8Az2wVsz5fcy+erS6XfYpukMtwPtka6Ot/iZYFlTMK3363cjFH1XFf
         1+RrJXZyDr18iLZDBMAfjbZDeIUR5ulRj3OCsWLJAZ3RXQf/MHxrHS/ob3ZRlXT0d32t
         E+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365144; x=1774969944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DkvA0f0R1I6yYwVuzVRz3vdcNRxquFRNpQPJVodbTWs=;
        b=VCEp2bvR0/a9pWi6+OUTvo65b8QkUIPLI5+m1SfCwx5fWqatK7982KGKK5o455oe+T
         5UldF7WwA7FJbFfR+aW4xx38iNH/lOSXFl3VfsyhjV8Bi7Oyx+Yb2kGlWI2nqLPKAp4R
         6iwsI0DT32tX2Ib/hGB1Is2Xm205cd6csByUlTaLa6na5vxVGHb5BUsXIiKQF9tzjdsS
         p2ruyLLvgt5YFChyvz4jCNv/jxqRd3qzDoNB9n89x4z0fR/2QPs0KkJiuw7uTQGMR8dw
         D/3lv7YyLAAb7GSLEH/RjiliDe/1GFJpPGAwlqB7eNbz8VO4OIGk0fSMEkZbhkIsiuyS
         V13Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgEAD9q5YugYXRJVpItXnWuD05o4x9rrtXhoqgf7WnWs+fAkPcp7bhw6iOTVzZiQJP5O/0EwtkIko=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSbvZrbPgPh7mPPbXo9PMaPkMZNNVPEFffBE/Rtx4TwvGNOfgJ
	k3Xt3fFYUFG2F85FMdYFpQQ43bNY68zTPGODRWGtSphd2AW6DsgqaYjeexCIOjAIEbitPEBJSZf
	VM2bIZ4qoBGH+fFe/VW3R1iZ0hkKsEuA=
X-Gm-Gg: ATEYQzydGL22fbUbXspj7FuJVMZmG/x8zDh1rW+rCW1AhYXSg2BzI9Ykgr1TL8VW//j
	EjByEIpAuptguxaemQDtF8h47drvSycaCAaCR2K4wRSlcNdmFkx0Ix7VpDx5RVBb2rpD0MHDthW
	UYaQPRWgUhgVPbc9Pt/LO7v+Ks4zGJZ04cqZ8nXpePqa2Bamv7zBifw48Cwj0TaYDDzR+7trpMl
	Y1fukD5ksfXvFErehgo55FZ+ErPnzEJ+OZpPEp1+LtdvbqHQkfKXAqo2RvhbCEd89ZpATaStQbX
	6AoqYKXNp9I1FFM9PlKBn7+eTVV968Or2DelEgwGF59vvcLX7XgGJzRAACTXt4QxH19i0P9gNPY
	8K3K8oHydreyBYopUS1/kE6zYxw==
X-Received: by 2002:a05:600c:1d02:b0:487:716:2fa2 with SMTP id
 5b1f17b1804b1-48716039accmr1663945e9.16.1774365144110; Tue, 24 Mar 2026
 08:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324062028.2479059-1-suzhidao@xiaomi.com>
In-Reply-To: <20260324062028.2479059-1-suzhidao@xiaomi.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Mar 2026 08:12:12 -0700
X-Gm-Features: AQROBzAeVSzmHwocMIzC_T43SeE5ZYGvZMyy7DiwYCSIR-IJMsc074leAglTCeM
Message-ID: <CAADnVQLbtuD=7mtGZFR25ULhjZ-3ifBpkyRcqu9jPSd2Mt3fBw@mail.gmail.com>
Subject: Re: [PATCH] docs: Document pahole v1.26 requirement for
 KF_IMPLICIT_ARGS kfuncs
To: zhidao su <soolaugust@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, zhidao su <suzhidao@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:22=E2=80=AFPM zhidao su <soolaugust@gmail.com> w=
rote:
>
> Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole
> v1.26 or later. Without it, such kfuncs have incorrect BTF prototypes in
> vmlinux, causing BPF programs to fail with 'func_proto incompatible with
> vmlinux' error.
>
> This affects all sched_ext kfuncs (e.g. scx_bpf_create_dsq,
> scx_bpf_dispatch) and other KF_IMPLICIT_ARGS kfuncs across the kernel.
> Ubuntu 24.04 LTS ships pahole v1.25 by default, causing 23/30 sched_ext
> selftests to fail on affected systems.

I don't think that's true.
At least when implicit args were designed the goal was to avoid
pahole dependencies.

Please share exact steps to reproduce.

Updating doc is definitely not an answer.

pw-bot: cr
