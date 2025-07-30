Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B742DECBF;
	Wed, 30 Jul 2025 17:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753896937; cv=none; b=R8DpSNYaGPHTfX3utQ1rjo1kcQbxC98YVFpDQ08VvXykkEPGhbLtEALUgpcF9R1m86/BHHtSaFvA+gEahMUPhKR0t7hpiIZHBLCQrvluQhnGn+Qo6nLKR0wQg8Kxcaduyz+MN0tU/d+bVJa6CM4xBt4+UbrIp52z6p7DO3uXbWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753896937; c=relaxed/simple;
	bh=mBIPSC2SfTHg7ragTq/TxT5NWv9iMduW9WUrCuOL5q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUZZUoY1Y+Qmsdpfb9AjXzSZPALvHkS+dSWDR2QMvZcHM2CCeNnKmMgjXsKZNWhp94CIPj9Ng8DmVEPoCqYljwsREufHvM6KmToPLGer2xQeCADVwZpeE/cRWgqevQRod8BhYkKoU+eV5HIBAIDIgYC2YygRgX/E0PUGngYs8qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=pB176l38; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="pB176l38"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=quVgobNNfMZi/K3V1npxXwvY90xOE2Oc/x30TsUJKbk=; b=pB176l387k/VqNnEsQdzOYm+KQ
	tfdS/YdY30DRNW7MqUSQygfb+9dIr19u0fDa0BIBRYuZ+1NF8s26ExLTvSBrR9VSQUmCFDHP21Azr
	uS80tfaKN+PaQDqN96QzVLZ/VhQbCvzJJvF6EeYNsdT2HCFs+X4M0M1Vki3kvkj5m2sIk3zs76WET
	sZWLzuzkQp8uuPagsAJ0uNwvtkgZkjNJtpSTkcWr6bT0vdxGg2LzwGidFJ2VGMF4gWGUtrOB4TCf0
	4P4NX/v+S3DcUwUY1CJcSLj0vSmB5ff8w551RHBxwmjsZ6vHNCGp6OVwntaYvDCiDw58VDWe5rdcx
	VoO0BRXQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhAi8-0000000FDdk-3TOM;
	Wed, 30 Jul 2025 17:35:28 +0000
Date: Wed, 30 Jul 2025 18:35:28 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Sasha Levin <sashal@kernel.org>
Cc: Kees Cook <kees@kernel.org>, corbet@lwn.net, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, josh@joshtriplett.org,
	konstantin@linuxfoundation.org, linux-kernel@vger.kernel.org,
	rostedt@goodmis.org
Subject: Re: [PATCH 2/4] agents: add core development references
Message-ID: <20250730173528.GN222315@ZenIV>
References: <20250727195802.2222764-1-sashal@kernel.org>
 <20250727195802.2222764-3-sashal@kernel.org>
 <202507271937.EC44B39@keescook>
 <aIcD9f_52tlLgE-e@lappy>
 <202507272203.BECE244@keescook>
 <aIcRzndNUdh-9R18@lappy>
 <202507272310.FCB96F5E93@keescook>
 <aIpHhR8AhPJZE2Rp@lappy>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIpHhR8AhPJZE2Rp@lappy>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Jul 30, 2025 at 12:25:41PM -0400, Sasha Levin wrote:

> Critical Requirements:
> 
> * License: ALL code MUST be GPL-2.0 only (see COPYING)
> * Signed-off-by: Agents MUST NOT add Signed-off-by tags
>   (Only humans can legally certify code submission rights)
> * Attribution: Agents MUST add Co-developed-by tag:
>   Co-developed-by: $AGENT_NAME $AGENT_MODEL $AGENT_VERSION
>   Examples:
>   - Co-developed-by: Claude claude-3-opus-20240229
>   - Co-developed-by: GitHub-Copilot GPT-4 v1.0.0

  * for any patch there must be some entity capable of usefully
    answering questions about that patch.  Legal certification
    be damned, there must be somebody able to handle active
    questioning.

And no, it's not the same as with human submitters.  If entity
A sends a patch to maintainer B, who passes it along and gets
questions/feedback regarding that patch, B might have to resort
to passing the questions to A, to confirm their understanding
of the situation.  And from what I've seen, LLM tend to do
very badly in such cases.

IOW, defending any agent-originated patch falls entirely upon
the human "co-developer".  IMO that is a critical requirement.
