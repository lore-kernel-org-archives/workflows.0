Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BB2762F7
	for <workflows@vger.kernel.org>; Tue, 14 Jan 2025 14:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864755; cv=none; b=RvHQiB0QNwEhsUccHVTAXbiJErmvpNJ0I0tWZfqtUDpwCdz48Snf5cnyZ1CTgabpUCSkIhuFPyUIRjhjAqfUyahWoN0vGQKfm+GL1E8Gbd7rTgOBupIugkMRXmYKPD2b8QliOqnIRCtNOH02Qyhl0WJnJnauV8Ch6pNYeVerMLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864755; c=relaxed/simple;
	bh=qALkaZejLRCAKvi7F9k1IIffiqedw9heQwLv80idL6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icU6Bh1PprlOwWgh0FmWE5UcOw3rnTWA0q3STyzNPQB7S1y5RFK1l0lzOrZryrrKLeXjuDREi1KpMm/nd6/p5dSL1W7v6jP1TGsGCYiq6Zwr9U/uhaJhQwvR6PGxuN/udnPkjfmkrlW/L52gkro7B41yYbnTDOBXzSW1mHKQF0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=clei1b1v; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="clei1b1v"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4678c9310afso189211cf.1
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2025 06:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736864753; x=1737469553; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qALkaZejLRCAKvi7F9k1IIffiqedw9heQwLv80idL6w=;
        b=clei1b1vT7AUhtqVntD1tfBZBko/cfhXnhpmgUz+kv3N5k/kIMJVJIjjlcqbQiCnCz
         Gj8epuIL4IP2BHMb9RaV06u+baTMb95PPhkUzMlXiwJusO74nBmjr+Zq4PUcB+VcO52v
         a9vpBxMfehMNrKNTbxnpuV41QQFahMULSTgu+xhBIwycsKbsPoun4ln3Uh27E1IjVccY
         WTUGhQXNe66YCbFr9cmOBDqDOZLRD1gY3OpLpILjfzg7DfTZD/FxGTBSwAY6B0oKdAxp
         MOj7nnboExH+Soe+MRO9O2hBwyJ4cHEMD0OvUjXB+WOdTZsu+9JucTB3c3zTuHoCOi5R
         a3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864753; x=1737469553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qALkaZejLRCAKvi7F9k1IIffiqedw9heQwLv80idL6w=;
        b=IQ4xCcvETjT2Yd7DOyEyWrcmmf22/jy0CnvLGpC5Il3VDwB9wXnnxxRbUnI0X1NMQM
         2AckXX32U4C5jD8lKll3OokllntBHL3A2z8txCSw4y/8a+ofVUmnz1QxJNwuEUFGBhMa
         v6ppcq/pDmER/aUkhwTy9MstBDy0kM4G2VYPNPdePN8gKFzZ5xtyCDcn3ZW9Wd+Kacby
         eBFgCNKyVWL89fEo5cLpHi8bgKdeJFL+JnDQFA2MasZnMTZAzpqPsZ5w+NIgNKidgXRM
         hTqIhtUiA+Y2diV7YxNOyt5SD1WZSYAKZwHk71004HkQp6b76xwlKSwJj/+ilyHCg8b3
         YWdw==
X-Forwarded-Encrypted: i=1; AJvYcCVtSZpoGyjKtmM72Dql5wYXJz7kxXr7+hiCWcU6J8i+/ARproroDzZTuzpjylo0qqbxqXR4leZ3iPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbltKdTtKWQms1UXIp3LAfQ8Dfci8ZAHr2KseuRXwymRdo6f5W
	cSQ3k+sNrSMJIoBea2dUc3tkodWS/ugonYiMBRQulP6j6z+e62CuRFZMzI4Xp8F0rNkYoKH3Jnb
	vdeSpHirFIul0xJesDQ4aaQ1nDQlzxR4SCu3r
X-Gm-Gg: ASbGnctDMzproUoPA7hk4XSkuuBWyif0/RKxOXo6CJMCvlwTFSbzMAYh5gKDfJRJ/92
	k/vJYQZMuRJg1kR0h8FLkEdRfeSdkWZRCf6PIkfGBPl6EKnbFqn2hJ7yaXrZO2hyCEn8=
X-Google-Smtp-Source: AGHT+IGjrbaMUm41SI8/RFz79KfGFi6rmwkPY4EHdeRmfSIsfBXdtAwuT3gfLls6zxJySMcSbpauQs3aOMVuLE+q4Ig=
X-Received: by 2002:a05:622a:1907:b0:46c:9f17:12dd with SMTP id
 d75a77b69052e-46dea91c95emr2507011cf.19.1736864752544; Tue, 14 Jan 2025
 06:25:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
 <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com> <5abiddu5zgxdmotauxnohnk25zyzd3cbjlfgskejk5ta7arzk2@pjpofoy7pcce>
In-Reply-To: <5abiddu5zgxdmotauxnohnk25zyzd3cbjlfgskejk5ta7arzk2@pjpofoy7pcce>
From: Brendan Jackman <jackmanb@google.com>
Date: Tue, 14 Jan 2025 15:25:41 +0100
X-Gm-Features: AbW1kvaDSAAHY1qPLZLDmsDzRyFhdmiLO9EYvorKtshMNa3sMJ-OddIgCQcRTh8
Message-ID: <CA+i-1C1WF1cSvcNABGRbg34_aaOnSoVoDNBR357q8rrGk52OPQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch footer
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 14:34, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> Do we really want this to become part of the permanent commit message? I'm
> pretty sure this won't go over well with many.

Why not?
