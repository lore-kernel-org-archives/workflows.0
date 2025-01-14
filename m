Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C43234D11
	for <workflows@vger.kernel.org>; Tue, 14 Jan 2025 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736854972; cv=none; b=RLepqk6G/2TzYnwkFkZgkwMPqHG+0Fav387VQYiylIMSA+Zk/VDFVk5PqQkGBGne1sgPfBLM3vbXCDNg9ObCtefOWkshtCGfaHirw2DZaHHMcNerFfE/Wc4XMtiA8t14p31M9TOIvb+JEHy4ZFcGZLLbLeWJJYxNDY2W9coTJlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736854972; c=relaxed/simple;
	bh=+uspVXU2ZDiusAOxtXBa2fGMjWTPAxrClAQyrfIyd3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHv1aar+SSeGm2awdZHg8c+qY0f/GJCtoOBOdkUIcuQ6hzsKwEhcZxF4ELjfwzwlClyAHPVdp6yOwPkm4AGPTIRxDaDosNfQ/hZNWX/6hlOFVcVKyZ8w5EjmqIsiCJYCODCBksj55FOCYXm0+8lLb9H06q9dX23H4Yk1gGQ+aZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m4PyjiLD; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m4PyjiLD"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4678c9310afso155871cf.1
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2025 03:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736854970; x=1737459770; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+uspVXU2ZDiusAOxtXBa2fGMjWTPAxrClAQyrfIyd3k=;
        b=m4PyjiLDC8rZFu/rxQ1sKIVvjyRPIQw064Z5KFTZBWFkaEmYHzuxZQRcSOkrTV/HHW
         /HviSEMmicAxREs30DucCjbnX0BN5JfBQCABMnm7zYS/grb2/zpVY1d+Gn2xCAz994dD
         1VaBIOkl/eitBwWLAC6Lh9Dvsu81CWgYBsq/R/9xDoHumr2ixvqAvfx81RUS4fEUTUKD
         ooHiSp+JQJYfbde/zps3AQ6Ol6gtBhT+WbH0Itg7vOMIIwCQ+TNkgZp1qf/8Rx2UG3m/
         cNIZOxEJGj9u2Tfvi8BuwB4kbKA05O3JgxSQwRRmNkSIyTMyjZUmwgdYpDjR9ZcfgOx8
         Dq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736854970; x=1737459770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uspVXU2ZDiusAOxtXBa2fGMjWTPAxrClAQyrfIyd3k=;
        b=YKDsFc5Y3O7nAi1/NPZsIfLu5JLZkU/K8zmRtJg/RppZWDRtjg4hpU7nGyyjAyPUkh
         VvUu0BEAd1o2dVkCeTScCaLSuhzToD099eFY2VcwCc2+NZECrTqnXIinrNORT6QTTjzf
         MHcQYN6NbQYLEU4kZjXWEo6CAibUME9TixCk4t1bVPmg/5Q/1FfjOvEfJqpn5AqYzPbV
         cjttQgNCXlBI8WfF9AaMs7yH19lKbYG9yZ+oGAf8QL2PHgKgfUnNzEQ3IgFk/imzCqtt
         mKI98ovYsfEQg2DNT4cGCU6jbDtxccxGdHEUg+NiRYwUPkVmRYbW+d8pacDPtK6kPgMa
         1siA==
X-Forwarded-Encrypted: i=1; AJvYcCUDDrIkZpPjtmLJSIXp23gEeRts8kbhlZAfHm0tUFWLHilfP6Qt0IBzGA63T8AgrODp9bjs7pmqVSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyclggP/OLDvyLCUb6reiQ5jR1sIHDdzMW47mo2RUR6JDRIkGJx
	898wYpQgJoVXuA8Cl2IUYahFnBPHCLajDckSk662wQPgoZ70uID2JW99BQDJEOXMRjqwzxVc0Ri
	qtatNoymVoQA/1kKhIn1ekwpM6NykNQlg0eS9Q1XUlFFb9pmLT7r1OoA=
X-Gm-Gg: ASbGnct/yn6iLNK1BuSFLO1gzQPQm38Wnr2ZGLkJaVzcAg4ebutZ8mRDtZAZ4ddw9nC
	lO9I8UEfDVX5fB+xxh2tK7q6NbrIIFyUPVJT12r7NHCsZ1iQV7QVktUMJSNQEvxpizhc=
X-Google-Smtp-Source: AGHT+IE+BzXnKsADctv0Lzt3s1gudsJx0ESLCW406jW3C6rWvqA+lwuaVs6VXnvbjcQHILOUxDSndm9ahHL6pdb38vs=
X-Received: by 2002:a05:622a:4c0c:b0:46d:f29d:4173 with SMTP id
 d75a77b69052e-46df29d41b4mr53371cf.16.1736854969835; Tue, 14 Jan 2025
 03:42:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
 <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com> <a1071d5d3dbfaa0e9e54b359d7b889d84d063804.camel@perches.com>
In-Reply-To: <a1071d5d3dbfaa0e9e54b359d7b889d84d063804.camel@perches.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Tue, 14 Jan 2025 12:42:38 +0100
X-Gm-Features: AbW1kvaF7Sb1tGiwE_COp-0rxs31ACZ8kLXsQz0Wlnyyh-eLJNH1HHBmYb-vdh4
Message-ID: <CA+i-1C23hyQJmRQXM2OgCcxRm3ci9b+fK=EkbtFoZj0WpTh7Xg@mail.gmail.com>
Subject: Re: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch footer
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	LKML <linux-kernel@vger.kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jan 2025, 20:15 Joe Perches, <joe@perches.com> wrote:
>
> On Mon, 2025-01-13 at 16:04 +0000, Brendan Jackman wrote:
> > Checkpatch sometimes has false positives. This makes it less useful for
> > automatic usage: tools like b4 [0] can run checkpatch on all of your
> > patches and give you a quick overview. When iterating on a branch, it's
> > tiresome to manually re-check that any errors are known false positives.
>
> If you do this, and perhaps it's not particularly necessary at all,
> I suggest using something like the message-id or branch name for an
> ignored types file and have the script auto-write the found types
> into that file.

Do you mean to say the problem is better solved in b4 instead of checkpatch?

I think that's a downgrade from the Checkpatch-args approach, because
b4 is just one of many many tools that wrap checkpatch. I think it's
nice to solve the problem for everyone.

Also, having the config in the commit message means it's there for
everyone instead of just the patch author. Running checkpatch on other
people's patches is not something I have much interest in doing
deliberately, but I'm sure there are those who do it. Maybe there are
even maintainers who would like to have their -next branch entirely
checkpatch-clean if that was an option.

Plus I bet there are just cases where it's interesting to know the
difference between "this author doesn't care about checkpatch" and
"this author disagrees with checkpatch on this patch".
