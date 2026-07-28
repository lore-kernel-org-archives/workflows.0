Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854C9448CEE
	for <workflows@vger.kernel.org>; Tue, 28 Jul 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248922; cv=none; b=EaqKRHCYqaR1hwdijoBqof4TF4rPECrBLFL+buVgoO4CcW767D6MTpzuFYg44gCcX9SUU5NfI7Lh0TLct3gtLIwoWpEUrLCLk/mSLdlHub6YwIQ2ZVqSphCKjhPwWEFHHICaYrlwxtKtrwso3ncETpomOsrwWTFwGEayyCKWiHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248922; c=relaxed/simple;
	bh=2OPHohF7Jx1CUiT2WZtrD3EMChRIaLKF018CoLW/EZ4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SufPtWDsmkunjaiAt/1jM+9n+KIejwrjyh+RFt0nsxgNwXlm5K7Q23IbnjEJpYFWUwNsDlRb2NfsPkGZLGZgXB3JRNIRUS9EmFdUKaVeOchChplcn5zOjKIx3k51JPukZG0Jp8zaaU/UunBAxlUzO6auhIi5634JjzcGOnH/ke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kf+Y5Exf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kf+Y5Exf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508F71F00A3D
	for <workflows@vger.kernel.org>; Tue, 28 Jul 2026 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785248920;
	bh=2OPHohF7Jx1CUiT2WZtrD3EMChRIaLKF018CoLW/EZ4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Kf+Y5ExfZ0o5T6d2UOWTHhr6rWZgcvLO9EvvU5lhH8Kb0bc8ioT+fr8sE1ejrM5XQ
	 P0fVRQR0izP5EXwuT5A3OXHYg6ui9UuFL4kXkIuG8zQrwpDlEjRY0uf5k9SJfs7u9K
	 iM+NtBjv0Velu8S8t7I+ulBLGQBzWYrvHTxdgFdPsuGp1fe8JkezIr3HhV06S+vc4X
	 3dWbRdX0v5eO1y1L0lU4lf1qnPleP9y88gRYaWffL0qMUUa6m+S2zrbtTzG2Zlay+0
	 z0XvzBhqfajOFTqipn12bgkZyTC1SV7pFSjddNMyGG/jMXrYV1yEpuDOJ/AtZEF0Ri
	 EmoiNH93VPpSQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b013084dc2so3083756e87.0
        for <workflows@vger.kernel.org>; Tue, 28 Jul 2026 07:28:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqtrwQws5DpNMkS1qkpLujoM7IN1XOj1XNITgqiByH0qfu9Hz1pHCLwbdfdVsx90C8qjQzQ90n+EN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ2A7Fk/2k5lMJzazgPei83f3vBdoEgLbuakyRDRZj90Ds498a
	Bz2Me80qiZWX7GCPeoJrHgghEQ5fi/w8UcAhRfP0gs1lirNm/DRgYSmoXyt7e2bA3LPV9d4x6Cv
	rMY57VkitoBylUtFZgP4qNzBUVoczsYXJfIPgTdPvRA==
X-Received: by 2002:a05:6512:1381:b0:5b1:5e9f:db79 with SMTP id
 2adb3069b0e04-5b2d023b53fmr547302e87.49.1785248919071; Tue, 28 Jul 2026
 07:28:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jul 2026 07:28:37 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jul 2026 07:28:37 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260724-checkpatch-committer-sob-v1-1-68550513106b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-checkpatch-committer-sob-v1-1-68550513106b@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 07:28:37 -0700
X-Gmail-Original-Message-ID: <CAMRc=McFJaotv-Y=_hzHR5-1UL6d3Ggka0Nm3dSOkvn1UUijaw@mail.gmail.com>
X-Gm-Features: AUfX_mziiQo7xcBaU68v4yfqE9p8ftW2Y7Fbdaowu4-NkPE5CNlke2OiK0Gaz6E
Message-ID: <CAMRc=McFJaotv-Y=_hzHR5-1UL6d3Ggka0Nm3dSOkvn1UUijaw@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: Validate committer sign-off
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jul 2026 20:56:00 +0200, Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> said:
> checkpatch validates the Signed-off-by trailers against the patch's
> author, but misses the opportunity to also validate the committer when
> run with --git. Maintainers therefor need third-party scripts for the
> final Signed-off-by check.
>
> git format-patch provides the author and patch content, but not the
> committer. Extend the existing git log extraction to record the
> committer identity.
>
> Extract the author sign-off comparison logic into a shared helper, and
> use it to apply the same heuristics to the final Signed-off-by trailer
> and committer.
>
> Emit COMMITTER_SIGN_OFF_MISMATCH when the final trailer does not match
> the committer.
>
> Assisted-by: OpenCode:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

I too would like to see this applied. The alternative is to get emails from
linux-next maintainers after a bad commit is already published, which requires
rebasing of maintainers' trees.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks,
Bartosz
