Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AA736D508;
	Wed,  7 Jan 2026 18:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811235; cv=none; b=nrX9f01C0qcUUCE13JEUFl93e2MB1lxPLpmenYwobGgAgxN8j0ZIGa8viXYloC9r/U/ZlmO/UICjJLpr+D/9lyAecyKRtmhH+Xr0bWfhc+T6g9+GufXvx+DVtyqEs2qiAV/4H/GmG6GU21EjAv2B/MHE071oZUWyj3YL4EksWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811235; c=relaxed/simple;
	bh=KN1F3N76uXgPHxPnP8THwhH7YE/P9z+4GwpB/BokJQQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KwDP/zkuVBnHg5zF0Z5Enmn9pvSYms0vEVT7gsYHe8588RZjD8ApMhqI8Ulx9oFMNYejqVPqy979wRJRqyInU8uuXOc8y8qA/gozAx31SddunCbmhTeuJeXJOXRkiGHnJQ0FtezrOA1sfSmYWmZVGHmTrbh6HD3I+kjSZ5DP+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 7B2AA1AAF15;
	Wed,  7 Jan 2026 18:40:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 74C496000F;
	Wed,  7 Jan 2026 18:40:12 +0000 (UTC)
Message-ID: <4702253d918c8edb899a91fbd79b40199a013264.camel@perches.com>
Subject: Re: [PATCH] LICENSES: Explicitly allow SPDX-FileCopyrightText
From: Joe Perches <joe@perches.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet	 <corbet@lwn.net>, Andy
 Whitcroft <apw@canonical.com>, Dwaipayan Ray	 <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, 	linux-spdx@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 07 Jan 2026 10:40:11 -0800
In-Reply-To: <20260107171246.242973-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260107171246.242973-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: g8ohf9momgfm3jki9cwkkefc8obxb4qm
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 74C496000F
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/3MA6JS4YuikaxMt97ljJQKz8Fe9uDqnI=
X-HE-Tag: 1767811212-129184
X-HE-Meta: U2FsdGVkX1/pKl1HzsBiwxfyNXKtZuphMb2V69o5UcRu4pCC689lw9oLnJ7xxVbTKh7LOw3qpsEz8D1iFFcei14T4KHl7Esfvp7cvjXj7rmV3KJlB0E/7DoDFD32NYsHogVosLeYUYMh5jZ9CAhozK+bK1p2s3b2rFum+oWgDW9+ylrYxieGBNzbooC9J4/EZLGHySL3W2tydl/KAwcl4I9cm+EoG+uf30p5Emzj1pYiG2a4q1xKYA8PkWPRiitgoomk7fDwfqyEFeIKVJ1vhl7twiv8ZN9mVVWBSPuMn9+jATmxJht+2D8lhIT/DAan

On Wed, 2026-01-07 at 18:12 +0100, Krzysztof Kozlowski wrote:
> Sources already have SPDX-FileCopyrightText (~40 instances) and more
> appear on the mailing list, so document that it is allowed.  On the
> other hand SPDX defines several other tags like SPDX-FileType, so add
> checkpatch rule to narrow desired tags only to two of them - license and
> copyright.  That way no new tags would sneak in to the kernel unnoticed.

I find no value in this tag.  I think it should be discouraged.

How is it different or more useful than a typical Copyright or =A9 symbol ?
