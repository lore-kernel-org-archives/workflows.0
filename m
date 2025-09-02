Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506A622FAFD
	for <workflows@vger.kernel.org>; Tue,  2 Sep 2025 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831820; cv=none; b=GJVe6mYqQNVyOnxisx7Iy4UHm5pNUrxfeF5DLV+prj5i3m5VePhSrogu+yGW8/hFJsbi5VmKy1EB/Nk0diFMdNur7n0eWrdxn7BfPm8ezeQL2CkNbvU3WRE3H677pPSUyUO04sJV4JmILFhzUhb4Ait/jnRDcQjgUHBx1/6dbJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831820; c=relaxed/simple;
	bh=6RIt17l6rtvY+nJ0OVVe8xaeq2YQCf529Qu7R8rBWQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HF5cFMoqiAME1ibu03Ce6we17woW1yiJlmYo7NBN82A8H4nmJq20suzsHUThZjSW+Q6ZqDrG1FoCWwIhDrOxPl8m1VYbpjrJkurkmQNPtmeOVeCmnKpilC9Y/aQ1UbMb1t3FVvtfiLwECyDpo3smQnnma1+pAv0E7TnDZxE4ZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iVxktnQU; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iVxktnQU"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b30bb04ed8so3261cf.1
        for <workflows@vger.kernel.org>; Tue, 02 Sep 2025 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756831818; x=1757436618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSyrafM1QcRv6+/JfnS79ZJ1CJUifDSEbVFOqe4QmfQ=;
        b=iVxktnQU/yyZtqB1mdae3VmF0wyDDvDDqcx1s1j0PTIexofEpiSA718bzBpKiOX6w8
         83lSP+TyZqilKHdJ10uEg3P9ERWyc32e3OLf8Tu9TJseIuLxF+EwcAyA0o6f+8EzAM8A
         OqUK7qRzAbDZFNNvLboqlkocnmQbrXGimI9HCJF3a51xpqWANjGE9cNioMyzG7O7VYPA
         47uHqbzkTjlwCfjJcJUxZ4SAwpLOgssfan37jzxc1IkO/8t/pWV+Hb9ExJew8Bly/QUg
         Wmq3Ty5aUZKrWED3sDSDWgqYBfsifpLvN0scFj/qnM7NjcTevkUFrwMSUqbXdu6HNRDb
         l+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831818; x=1757436618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSyrafM1QcRv6+/JfnS79ZJ1CJUifDSEbVFOqe4QmfQ=;
        b=Kkrg0oh1kSOwMfb0vtN0HnSpSr/YemQxQJ5N185gOn06ku4K2krZVHIKkCppSMIGiG
         PM+y/CA0Nb/sAacEl5AbMLjHR1ZHxMlj5dWRl8/N8u2FJj/nJkpq7d2LN5pk0WIFxPfd
         t5xEJzRNKOoZAq7DikX5/7gWeevINxfH+r/lbgDJDYSCJBZBgMj1qsXeQum9fJjPwi9w
         AdM8lYM21NpYXwOto2G4DMTGIJ28z1c1tNJNvYN+V0hhvJJNoqJLoZJ1HdMI8clAS0dh
         XaodGKebXinB87eSSsC4ZpUg/3cYQmMvWqMaKmi8A17fDjwRD4KeZAQtQZXrM19QGMAN
         +J5w==
X-Forwarded-Encrypted: i=1; AJvYcCWpSKE0rtjKfucD77/0pOfC4gqm3v0ABwAvKv5MtrE1CyNlZxHJUjUpBbuKJcDsGh7HclbZgZ43e0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLYsTSbhn6pb/qZYXzHjg8Wn7IQ9EEdyzIzJXYGeYlxIeAV6v
	Z6BLlgUlL6/bxdnln6vQTwSLt8vbKp+sRnrE0X9NZIa9g9IRNnrPnkJj+epW+oiP29HHHizFs15
	AeUmNJ/em0V3M0fG/FRFjUrPfUXocpneDBKuxqjP+
X-Gm-Gg: ASbGncszGL2sBHMPsLJD/V2zQMWul3PQiV60D3HfRzCl1WysitygwUWtQjAK9d2OZ1R
	zJ3nG/F9ZTINk5ECI6qymgntBkD9WpM2W/TJeKKsrp+9fGqpsjnKJKg530f8pBlh05K2EH5dq+s
	mNvF4RqWaTZKLvxdIa50KNYx45vscGVx1ASkztnc8e/8bOAgh7v9rEndZAJbtRlptUgKS2ys+Tw
	BqKJ9zhvV5n/z6cMfDf/IC4HEr0JckW1pVhLv/Ax9o=
X-Google-Smtp-Source: AGHT+IFZRZdIhfajnXhlEKBqcpQ9ut7xCYenusy5bPozjAHfG8pzHkYfdT7cPUFCcvttQ5R84/Zpo/4ZOtaDR+q3ZIc=
X-Received: by 2002:a05:622a:a28a:b0:4b0:9c14:2fec with SMTP id
 d75a77b69052e-4b325008444mr11392681cf.8.1756831817870; Tue, 02 Sep 2025
 09:50:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831150710.1274546-1-harshit.m.mogalapalli@oracle.com>
 <CAMuHMdXSNoXjxAbALr7O_dD_btJDGR58XaDa5=bd8NmL50wcaQ@mail.gmail.com> <d2a5b07e-2da1-47f0-b2cb-a4ffa12a99b0@oracle.com>
In-Reply-To: <d2a5b07e-2da1-47f0-b2cb-a4ffa12a99b0@oracle.com>
From: Rong Xu <xur@google.com>
Date: Tue, 2 Sep 2025 09:50:05 -0700
X-Gm-Features: Ac12FXynsWsvMltp57ATRpCXmM0Uhwu2CvmIEafU2UjtQeosXaKLslnu08g_VGQ
Message-ID: <CAF1bQ=TB6KMAkwXfEF=ZJvJZqV8B9kEw3jbVMG4gRoLOUjksiA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dev-tools: Fix a typo in autofdo documentation
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Han Shen <shenhan@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the fix! I meant to include "/" in the original patch, but
I overlooked it.

Reviewed-by: Rong Xu <xur@google.com>

On Tue, Sep 2, 2025 at 6:03=E2=80=AFAM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> Hi Geert,
>
> On 02/09/25 12:43, Geert Uytterhoeven wrote:
> > Hi Harshit,
> >
> > On Mon, 1 Sept 2025 at 17:57, Harshit Mogalapalli
> > <harshit.m.mogalapalli@oracle.com> wrote:
> >> Use cat /proc/cpuinfo as opposed cat proc/cpuinfo.
> >>
> >> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> >
> > Thanks for your patch!
> >
> >> --- a/Documentation/dev-tools/autofdo.rst
> >> +++ b/Documentation/dev-tools/autofdo.rst
> >> @@ -131,11 +131,11 @@ Here is an example workflow for AutoFDO kernel:
> >>
> >>        For Zen3::
> >>
> >> -      $ cat proc/cpuinfo | grep " brs"
> >> +      $ cat /proc/cpuinfo | grep " brs"
> >>
> >>        For Zen4::
> >>
> >> -      $ cat proc/cpuinfo | grep amd_lbr_v2
> >> +      $ cat /proc/cpuinfo | grep amd_lbr_v2
> >>
> >>        The following command generated the perf data file::
> >>
> >
> > One might say the path depends on where the proc filesystem is mounted =
;-)
> > However, all other documentation (except for two occurrences in
> > Documentation/networking/proc_net_tcp.rst, which you may want to fix,
> > too) assumes /proc, so it is better to be consistent.
> >
>
> Oh very good point, yes I did check other instances and thought we make
> it consistent.
>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
>
> Thanks a lot for the review.
>
>
> Regards,
> Harshit
>
> > Gr{oetje,eeting}s,
> >
> >                          Geert
> >
>
