Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AAA213E69;
	Tue,  4 Feb 2025 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682316; cv=none; b=I+mfhuXWOB83gLqsSopmVMGhok45I/YOafwJaoCI+56o9Fy658xhTq3IGLe13RRHpbOUxAJRDvCBb50GjjJaiaasFGc45vslPIWidq/TnFkpapOZu51P8FEXtvNWYr5El9AwN5KRGz7Fp9h8FaOwr8JBgNJDLk7bV+exl/rQcmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682316; c=relaxed/simple;
	bh=C1wEET4W9frq7tAraVpaRPTGZ0k+8q0D2i/BA4JIUWA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KPTaIyFrUE6dIETnEeIdei4UibjO4QXq+sTNEc0LNUsbIyVE0MgfRqsNPg6IZmvDAoPF1o8tNxpEeGRWAwFA4cEJgHdbaHJCnL37ncT8tPtna+ztlnCTIm2I7gGU8Wm7xpy/RVbKDCipFqJHf/NaKY6vQBl/YGx+2QaUb2Mw7SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hovBtUJt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hovBtUJt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B082C4CEDF;
	Tue,  4 Feb 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738682315;
	bh=C1wEET4W9frq7tAraVpaRPTGZ0k+8q0D2i/BA4JIUWA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hovBtUJtLWbzicHrNYJ832PORnwq0cMg+47bhL4H+enycneJgBy5XQOjnAblPZW0D
	 s7q3TIhxtijkGDqi7HNPK+RCVi0/OxyPso8zRWn4K4I1wbx/V9G5V6aRGbL8Mf2LoG
	 7aBd/37QQFBP/rqrgSBbTi8UnYeBFR7lNS38pxHKcKcsI0ZviTInZrFM5FaOYIBAiN
	 o5JQ8Ac4kLxB9mRTc4WUjtL/Gi9MiLr0L6wIZf+P6Cjy65ZIlviMEzm4HNvXvNWyDl
	 WOcnuzd9abHPu7KEBoometEb1kSgLOJQHtIBfVRGbB56YGZYeKwIkTnR1uohfMLTNX
	 BiJCIzaE7ZAgw==
Date: Tue, 4 Feb 2025 07:18:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
Message-ID: <20250204071834.78e0ffb1@kernel.org>
In-Reply-To: <CAMuHMdXXNkpWjkKvMLd-MF=npzqJXMtnXkaba60JY7hCzyjz7g@mail.gmail.com>
References: <20250203174626.1131225-1-kuba@kernel.org>
	<CAMuHMdXXNkpWjkKvMLd-MF=npzqJXMtnXkaba60JY7hCzyjz7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Feb 2025 08:59:28 +0100 Geert Uytterhoeven wrote:
> You probably also want to document the other popular[*] solution:
>=20
>     From: Patch Author <author+company@example.com>
>=20
> [*] Statistics for v6.0..v6.14-rc1:
>       - "(Company): 3430
>       - "+company": 2871

Hm, I mostly associate that format with MAINTAINERS entries where
people want email classification. But you're right there are some=20
uses, only 3 of them look like companies, tho.

$ git log --format=3D'%ae' v6.0..v6.14-rc1 | grep '+' | sed -e 's/.*+\(.*\)=
@.*/\1/' | sort | uniq -c | awk '{if ($1 > 5) print;}'
     18 huawei
    464 kernel
     46 lin
    742 linaro
      8 publicgit
   1646 renesas

$ git log --format=3D'%an' v6.0..v6.14-rc1 | sed -n 's/.*(\(.*\))/\1/p' | s=
ort | uniq -c | awk '{if ($1 > 5) print;}'
    177 AMD
    210 Arm
     29 Dent Project
     37 eBPF Foundation
    547 Google
     13 Hanghong Ma
    132 IBM
     46 Intel
     38 Microsoft
     18 Ming Qiang Wu
    155 NGI0
     26 NXP OSS
   1487 Oracle
     19 OSS
      7 Som
     70 Sony
    353 SUSE
      9 tencent
     24 VMware
      8 =E8=BE=9B=E5=AE=89=E6=96=87

