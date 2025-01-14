Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD9232428;
	Tue, 14 Jan 2025 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736861643; cv=none; b=cTkAPzsE4nJqGeZZDvSSra+0rIrq26SUlhlfoZI4RbYhNCEBs5ija+JJ/C+T+O1oeoDNvKyOLZQ2VuAWT4vHyFRCLoJQ83g4DkPox58K5VjZhWeUv4J2645ccrXqk4wynppGWXdmWEgE7z8A9qbFLcsI9cIFVKOnZmHHd5F52Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736861643; c=relaxed/simple;
	bh=p8xOQbT32szN6rTjjAXJTGWWqJummLcXEMxazfBMDF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFYam/Pg6RTmSKaP+aGr7ada0M7RwXCFhzmVBNj+NSNm9Jbo8qRZIhMsMtu1tsguOKCpzNg4kFb6h2JOmnwuCbBOCegC4SsGnXrjwUx12sppY45mNwFKXz3UNq5NGfpjLpo34t9EQ2k3sKP4vBoMTwNdPBNjR208GoBvWUuxsOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eXfFNVAd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eXfFNVAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC31C4CEDD;
	Tue, 14 Jan 2025 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736861642;
	bh=p8xOQbT32szN6rTjjAXJTGWWqJummLcXEMxazfBMDF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXfFNVAdTLJC/ljlk3utlbs7/5csWvsodDEothJicq1sdCxwAkIwk4eu6l1kt9/kv
	 0z7SIGHnejfpiZkzEOJgRzbaa2xm12Iq0AuCHVJ2bFV9pFZq3DhC1fmKxzxhsxd0Ma
	 C2FigfxKzQQQeu2N1H0cPlhUTI+KOOXf4iEX11k4=
Date: Tue, 14 Jan 2025 08:34:01 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch
 footer
Message-ID: <5abiddu5zgxdmotauxnohnk25zyzd3cbjlfgskejk5ta7arzk2@pjpofoy7pcce>
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
 <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com>

On Mon, Jan 13, 2025 at 04:04:22PM +0000, Brendan Jackman wrote:
> Checkpatch sometimes has false positives. This makes it less useful for
> automatic usage: tools like b4 [0] can run checkpatch on all of your
> patches and give you a quick overview. When iterating on a branch, it's
> tiresome to manually re-check that any errors are known false positives.
> 
> This patch adds a feature to record in the commit message that a patch
> might produce a certain checkpatch error, and that this is an expected
> false positive. Recording this information in the patch itself can also
> highlight it to reviewers, so they can make a judgment as to whether
> it's appropriate to ignore.
> 
> To avoid significant reworks to the Perl code, this is implemented by
> mutating a global variable while processing each patch. (The variable
> name refers to a patch as a "file" for consistency with other code).
> 
> This feature is immediately adopted for this commit itself, which
> falls afoul of EMAIL_SUBJECT due to the word "checkpatch" appearing in
> the "Checkpatch-ignore" reference in the title - a good example of a
> false positive.
> 
> [0] b4 - see "--check" arg
>     https://b4.docs.kernel.org/en/latest/contributor/prep.html
> 
> Checkpatch-ignore: EMAIL_SUBJECT
> Signed-off-by: Brendan Jackman <jackmanb@google.com>

Do we really want this to become part of the permanent commit message? I'm
pretty sure this won't go over well with many.

-K
