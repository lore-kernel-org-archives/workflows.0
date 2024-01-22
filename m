Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F50482C4
	for <workflows@vger.kernel.org>; Mon, 22 Jan 2024 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705957678; cv=none; b=aiyPg/mg3yRYBRVew9xLqrrd2npDCUeEdCR1M3RzHkn81GJZKmjIGlicUKgmE2XaoTzo7zkUqQsWzrY70INJGThBgfxcJG69U5WvS3JOw3Qj9/k8uwZwC7GahMqis/eY+wrdfiZ0r6yYBE6KowIuGPBkNXoHb2Xk9xdQ8LgWq+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705957678; c=relaxed/simple;
	bh=BWKAUAfQKe7YKVkz7OdSI5PwmM4hvY1Wy3EdKjJDO3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZKe7AcygwmvBMsG8Du+zdadnm7Iwunq+9T6RWeXrkBKqvFNRLpiyZjwILq1xwQ7ruCp2YKQceh/9ryi9RfxvNM7u6UbPCM4E8ljWjL2H4z4ly8KZHTLuTsuFGFiiRNylbU64uke3FFM/TNj3hD+JHby8+bPRUqh6aBE6UcAH/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8ZmsAD/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8ZmsAD/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E815DC43390;
	Mon, 22 Jan 2024 21:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705957678;
	bh=BWKAUAfQKe7YKVkz7OdSI5PwmM4hvY1Wy3EdKjJDO3g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t8ZmsAD/oPeCih64SiQOyiClyqdc1Ng5o2RwOFIX+v/wyPHDNeuQQvlZu8s8Y+TrM
	 c+YjdFPMTn9eGe1yUrkWl6oRq4geAoR9oNsTanl7c4pJ10VMx15+iUxUDIumKDGcKH
	 Tus7OnNrwo2jEwLqJMlBJiurPVtrv9h8YTH6ZmFy9s4TTMBTMPMpcRNcVguZXhEJtd
	 Ylbnh34aOqlPKJoKC6r6JN0j+efZaRWx9UckaOffSZME2yHisFexAR74Xqu85mG3dR
	 nPc4uUgBrXTeCUUpibisLPfMnxNtuc4lcuU8n0kMaqRbGEOtnaWDKnLfrozUD+IdMN
	 IgaZiRhsgXgoA==
Date: Mon, 22 Jan 2024 13:07:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <workflows@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>
Subject: Re: Patchwork Acked-by question
Message-ID: <20240122130756.1b33f257@kernel.org>
In-Reply-To: <403a40ac-10f1-46d9-bab4-86cd713fe5da@quicinc.com>
References: <403a40ac-10f1-46d9-bab4-86cd713fe5da@quicinc.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Jan 2024 12:10:39 -0800 Jeff Johnson wrote:
> I co-maintain the ath1*k wireless drivers with Kalle. Our current
> workflow is that I review and give an Acked-by and then Kalle does the
> actual patch integration.
> 
> My observation is that when I give an Acked-by mailing list comments on
> individual patches, the appropriate flag is set in patchwork. However,
> this does not seem to work for a series of patches if I tag just the
> cover letter. Just curious if I'm doing something wrong, or if I'm
> expected to tag each individual patch, or if this is a missing
> project-specific configuration?

This is a long standing limitation:
https://github.com/getpatchwork/patchwork/issues/113

There's quite a few annoyances with patchwork, so people end up
scripting around it (netdev+bpf maintainers use 
https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/pw.git/ )
or using b4..
