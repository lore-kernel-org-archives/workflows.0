Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2900225EF87
	for <workflows@vger.kernel.org>; Fri, 16 Oct 2026 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166338; cv=none; b=Ax5qSEeCzsELKQ5cfHHmed1nDm6JlSnWXj8L/6ffCqUfAqNHHu2TGxp/ix81xiRfmkRqhF24Mh7Y/HZMJ6EGx+bfag1JPxOtV/m+vdkvUz0sOS7NKmHVr8f/gRs6Vd3l8k/GGT1CqUKFxAkD9Nxgay5oACrVZWzkd9rIWxvMYhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166338; c=relaxed/simple;
	bh=JqL4+jW/dPxuUWw9P2AtsAeVwSlP0jkggzpO1fy+cyE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=ZqnF6kBZ8bPP9fOpyYBrTTwL5dGIqTMP8iqnno6OLLUxL8uiHpBaCvn8dNDugOw6oUP8OjWQdwg12G9hT2VgcLzHdYl/8fLRhtB/9tyxpLyLOeAMy4I5HM4AHbnA/WYxFP/TtLTSbeRk+fhV4usZZJgNlp7nk5H5SO8URCBX82M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHy0g03g; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHy0g03g"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4877837890fso77637fac.2
        for <workflows@vger.kernel.org>; Fri, 16 Oct 2026 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166336; x=1792771136; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JqL4+jW/dPxuUWw9P2AtsAeVwSlP0jkggzpO1fy+cyE=;
        b=OHy0g03gx7siMgxrgc8b8AZ8HWAQQp4scuBLSHuhEvaMZMG69vQ5moJfM/ruNxmd9E
         4tWCQhYQljs1N5bsjxAf1zITMRKID/jhaIV6mWx0nQ/Jy+iI4+Lg8ryDMJrigLXWI2Np
         1YZwDIVUlK5ILajo9jSUvTODOCiHc862qkOav6iQNtGCUPV8t5fM/7cdp9q95UYOMoHX
         NIZQoDEwf7jmtzaLYbQTngm5M62GeIFUtMNH8M+raAkDZoKB96Tb0D6XcL77lF4T6pAK
         TIxT8XzU3XIUX3gdNmv1xB2HjSZwIaAAvl23Mg1F7fm7B+vzagjIqgt5WVgC5i7JqlnI
         heFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166336; x=1792771136;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqL4+jW/dPxuUWw9P2AtsAeVwSlP0jkggzpO1fy+cyE=;
        b=UJv+JOAig3PL4ytfMJQFeueEqrpdzhbO652x0kDWzDsud7/sSpzk7ikNCInqcuPIUb
         qJcX1UiykpL+3JK1UE6hae/i6QhNRJ5RNipQGhJ51OQzV9hKyusyB058tQfXaduu+HpX
         smO3c/56SIqDLUnRZlJfCPsfzED9M07qXDpew5XtKJWLeQHiKAyWYg0hwZMKbBeeBP3F
         DiaI09pBo4maDJAgRG1mfQwCHN0EM1mF8Ne3ByTqBzpuGjcYSADp2jvNgRYxbOIFlSjQ
         ATQCBQZxv7BThmxMnSZ0fZTKqr2cBAWQLq0GdNe0Xjc2//IV6pP9c4bNKSCZW+58VPLa
         H82g==
X-Forwarded-Encrypted: i=1; AKwUvBxsGnlK2jjqtfOrb1QcttAyDR6LY39yZKc4+67MvtaBeByOa3vVsdHFOQ8M09udz1VXidvFz7juH2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoBzLjHHZGSj1LClblvHja/OLk55AJXnZa+mDkvSsEVD3haH2p
	KqAQlEX3ZywmGxHm7FHYJtLtDRh+9s2xjm1qlVqy1gv6+klH4kdPs43K
X-Gm-Gg: AYBFou0pXKgvwt+N4z63QV7aDnj5LCKDLic9mCJP7wVAk8WABkXipDD7oUXIf4Odzhm
	+7rx4LztzuaYxJaat4m1vjGvZyGyqmCa4osq8Fe1mvmFWK7N0Zlg0vPLL8GqZSEHJdMxZsvDuey
	0KuHv9owwP3C/GeykwClRYvSdJoMFgKgsAsJeUJjsbIhvaaPnIbll1QLdVzBxybkFj1rfaH8vfm
	zK6wdBCPNkKBKzSH4T/xaFV5kUopIY1H3zGqwP8cr9XsagR+o+bRB/Gn4JwOihPBq5Zkwlyks2H
	3h+LZvadsygfiE0qImCNGAVAGvcWC93Srhvm9H65N5FGF20nlorEcMDF9PcjZgkRW7E32o6o512
	ms+rTxKkxd89aQ9NPeQNTLRP0zi2SjEf69ZAR4Gckfzu4TrXrXtKcABTQY84Ms0lfVvA53xGf6Z
	J1982qfV0HbcYzvDet/AZHVPYeKek4jtHvZB23gvUVpayzuE8G/+yTa1B3G+L065slidmpn5tkL
	fOaYSEL6G5qjASahs7gsSST4sonYIHg1nJmmkTT6sjXM2jjQ+uNetaxYbcdQTi5sriHhWGSt1eO
	lxY=
X-Received: by 2002:a05:6871:c91c:b0:49e:5d89:be9a with SMTP id 586e51a60fabf-4a757a9a88dmr355079fac.58.1792166335764;
        Fri, 16 Oct 2026 08:58:55 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73adff016sm2102314fac.0.2026.10.16.08.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 08:58:55 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 15:58:53 +0000
Message-Id: <DM6DXZJSMPO3.J5PONDJ3HWNP@gmail.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Mark Brown" <broonie@kernel.org>,
 "Theodore Ts'o" <tytso@mit.edu>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Leon Romanovsky" <leon@kernel.org>,
 "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, "Thorsten
 Leemhuis" <linux@leemhuis.info>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/5] agents: add a skill to find other instances of a
 fixed bug
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sasha Levin" <sashal@kernel.org>, <workflows@vger.kernel.org>,
 <ksummit@lists.linux.dev>
In-Reply-To: <20261012213452.1863248-5-sashal@kernel.org>
References: <20261012213452.1863248-1-sashal@kernel.org> <20261012213452.1863248-5-sashal@kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 05:34 PM Sasha Levin <sashal@kernel.org> wrote:
> +Each confirmed site is a separate bug. It needs its own fix, and its own Fixes
> +tag and stable decision, as described in agents/skills/find-fixes/guide.rst
> +and agents/skills/stable-tag/guide.rst. Sites in different drivers or
> +subsystems usually get separate patches, possibly in one series.

I don't think it's a right message to send to agents and humans.
When the same mistake is made in N places the interface is the problem.
It should be fixed in one common place.
This text tells the agent to produce N spot fixes for N maintainers.
We already see this issue on bpf list, let's not amplify wrong behavior.
