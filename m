Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961F538AC61
	for <workflows@vger.kernel.org>; Mon,  1 Jun 2026 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302464; cv=none; b=hqUUlZiG0AFbWnBqsRzwumw4kV82pIMwb22Hhkunpt04eCwVPXOBL8XrZ9cttm9I/VoHNGU7LmI58t6ZNMGlu9/a3GTT2M3DommsjClwn+K2raVnQGzhpIcaTVs3MzknnfXPtlLzY2DxbcGxGWVDE8OGWPec+sGynKuvW7WULzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302464; c=relaxed/simple;
	bh=DQWOvDV3r5aTyVufBu369E0XwAKET9OrDYm0JbKMgys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3qqNdSHMbSeSvLkxu9H7CTYCi1ZoaWho93rDOs9uTCiv2dW2njQYXSW/fuHvFtkYqgisC3ZaZpvLS9gUhpOr9f+IoihyTQt0Bx4QSmHxuoCNQay7SScsXxr4j59Lvpm2bs96wcNNS0yR0/Xshzs4xdCYynzv/vOL4gEsUsDn88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6c25b040555so1956749137.1
        for <workflows@vger.kernel.org>; Mon, 01 Jun 2026 01:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302462; x=1780907262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBVqrpkzCm+Tf1FFUXfAmEkqU6ZtJx3YbVdoRHIIa9Q=;
        b=JhJ+bb3vieZEqxlrTDHXvR5UPS8DVSN1scXJAkTA4ZE73UV+qNRr47TpUctXmsAW8g
         GbYDcSK+C2+8M9U+gSa/F5lZU4r7sZuvgHVccVuTjTSvo2pcVBJAPZcSCaUoMIMx4US8
         UytOrzhaDCVeULclrcGvebT7KczbL+QsXwJ3MhThHHGJWBJZruU3NolG+xGdIU14kSeq
         h1SZENvxQ5VliQ7PVIOsnIAIlUafK2ugFMgiYCtZfNd0VYS823+treTHHlaXHffpqjMD
         g5RchPICCdfo59BY3JhJzT+NEWvar1KT7PfmoDkr+7zSroEp3skzoaTcCN1mkM/dtF2l
         7oxQ==
X-Gm-Message-State: AOJu0YwsabTkJK0gFfdkJ+6qvio9M2l9PaZGGnAZPpmHPQ93me3/jOPG
	ypQxVHVJGi1Eq0nRZoNMik22syJfpQgaxfvXr5qsXj4NCLUP1Vcqt5ya9G8RhPUr
X-Gm-Gg: Acq92OGcz4IaRaSCO+69CtGA0hmbm+QnP+LIDh40DHqTFuLzDCvI3QDm0acrpaDhLxB
	eMBLGIKsLWTXprUtXJQy0lAHqv17TQtbMhpr9SW0jANqMTJFAwJmqO7s+KkHph+77OulMTLxOwI
	ORTweheZ+byu07d0EY5yTV+Xqb9vxlN+sbsnEgEyoPIMRXilec8gnwQCCSpCZ8E3Yb+DkjlPHpl
	T2YWg/epMFiiZNJpLjKGZNo5MBTOcy8NF4RnHRxhAasChWq6BYm+jAWBf7EBUkF8ISqSzVKg+x9
	J39YHvcfVCPn1p/uf6gVN8WMp6R2Ry8Qw8G9hAsyrgopSK1bYiR+MWPXv3joxeF6CN60bUTujan
	FTOazsGsGI7uHsudCFeB1jgzwl5rkP8DWNGRxVbkDms1MLT/LDKxRUiVP3dUx5pY2y0nq61H78+
	0PG8tZG0doD/6u3mCa92vZ7fUXX+HAvb3spDL+P7sn/ZV179TGsb/6Pdu9+S0qR8r1DtZzLbf/n
	0I=
X-Received: by 2002:a05:6102:2d07:b0:631:8665:3510 with SMTP id ada2fe7eead31-6c68cd84c2dmr3781394137.31.1780302462570;
        Mon, 01 Jun 2026 01:27:42 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963abac87ffsm5624518241.7.2026.06.01.01.27.41
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:27:42 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59c2a81ca92so1282471e0c.0
        for <workflows@vger.kernel.org>; Mon, 01 Jun 2026 01:27:41 -0700 (PDT)
X-Received: by 2002:a05:6123:108:b0:56d:8ded:796c with SMTP id
 71dfb90a1353d-59bf21173a3mr4240604e0c.4.1780302461698; Mon, 01 Jun 2026
 01:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJLQH1vPmWd0gL2MqfsTPF74_cSKqb7H8LL8nwjK2gYv6mB55Q@mail.gmail.com>
In-Reply-To: <CAJLQH1vPmWd0gL2MqfsTPF74_cSKqb7H8LL8nwjK2gYv6mB55Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Jun 2026 10:27:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmDj8iiYnMryWifEDqiP1XXQvxJq9U6EaJEP+j9RTeww@mail.gmail.com>
X-Gm-Features: AVHnY4LdVVIjtgHtauMGTC371n218yiPgRGaFRRrq4WWmB96jBMEqkSYjUBNdD8
Message-ID: <CAMuHMdXmDj8iiYnMryWifEDqiP1XXQvxJq9U6EaJEP+j9RTeww@mail.gmail.com>
Subject: Re: Proposal: preflight checklist/lint for AI-assisted Linux kernel
 bug reports
To: mo to <pitar21@gmail.com>
Cc: workflows@vger.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 May 2026 at 15:09, mo to <pitar21@gmail.com> wrote:
> I understand that AI-assisted vulnerability and bug reports have
> recently become a burden for kernel maintainers, especially when
> reports are duplicated, unverified, or lack enough technical detail to
> be actionable.
>
> I would like to suggest a lightweight =E2=80=9Cpreflight=E2=80=9D process=
 for
> AI-assisted bug reports.
>
> The goal is not to replace the existing Linux kernel email workflow,
> nor to move kernel development into a web-based ticket system.
> Instead, the idea is to add a simple validation layer before a report
> reaches maintainers.
>
> For AI-assisted reports, the submitter could be required to include a
> structured checklist such as:
>
> AI-assisted bug report checklist:

Which of the below are not suitable for a non-AI-assisted bug report?

> - Kernel version:
> - Commit hash:
> - Architecture:
> - Kernel config:

Do you always need the full .config?

> - Affected subsystem / file / function:
> - Reproducer:
> - Reproduction rate:
> - Full dmesg / KASAN / UBSAN / lockdep / syzkaller log:

Ouch.

Fortunately I didn't do that when reporting 'thousands of "sync_state()
pending due to" and hundreds of "deferred probe pending" messages'...

> - Checked latest mainline: yes/no
> - Checked stable trees: yes/no
> - Checked lore.kernel.org for duplicates: yes/no

Definitely! Also for mere humans.
(Hi nvram mutex fixes ;-)

> - Existing patch found: yes/no
> - Why this is considered a security issue:
> - Impact assessment:
> - Suggested fix or mitigation:
> - Human verification performed: yes/no

Perhaps only yes should be permitted?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
