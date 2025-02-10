Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9080179A7;
	Mon, 10 Feb 2025 18:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213153; cv=none; b=A1aJtdNg1n6xH+zK+bsN8TkELAMxYxHiPGOuv0bQ9P8RwnhQ+9zKTuIH77mcXvTQcTQEK6SB+qRQ49if83gfyO71Cr7ZUh4mBgGt3wwgEphju7kPYuUBEge5JdA+XvLyuhuklfmmPQTTGg9YX+/5dWjcJZqI70gw/P6NVZnikmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213153; c=relaxed/simple;
	bh=OxufUJ2o8T+Klj4kZfDcOK7+unCwgJzZhMweXndRD0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoL4ukS1LjoWzp8IFglqMajcnLWakwb6BqK501DCErkWvJO0n6UffxO4oQvhb92I8NJqWiqJUyFno/7HNvreu12cqVX8bwVqiadRogUHfIBJAtqGhK/PlYYdt+mVtUbR9Vwc8Z3o7W5U8psWs1gyQQCKPRibkV1ZxZBiu3IegfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h8ui4Wzg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h8ui4Wzg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E3EC4CEE6;
	Mon, 10 Feb 2025 18:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739213152;
	bh=OxufUJ2o8T+Klj4kZfDcOK7+unCwgJzZhMweXndRD0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h8ui4WzgSvRoxWZZuq8i1g+IsdmdYp7SPqvWQFSMPTmytq6CA0BBLZg7F1V0QEXJb
	 BvnnbuC9R0hqDaSMQ2DtZ7pmAUBku2rZxZR5I2gB+DmNvcVoSsRXLCAcDfFC0tt9M/
	 bIzqvHoSgXT550nitTT6i6NfZTxaVMHYjHYyuFMc=
Date: Mon, 10 Feb 2025 13:45:48 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
Message-ID: <20250210-judicious-inquisitive-guppy-6deea5@meerkat>
References: <20250203174626.1131225-1-kuba@kernel.org>
 <87cyfpzlu1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyfpzlu1.fsf@trenco.lwn.net>

On Mon, Feb 10, 2025 at 11:38:46AM -0700, Jonathan Corbet wrote:
> So, despite all the conversation, I didn't see any real opposition to
> adding this change, so I've applied it.
> 
> Amusingly, b4 helpfully picked up these tags from the conversation:
> 
>  + Signed-off-by: John Doe <jdoe@example.com> (✓DKIM/infradead.org)
>  + Signed-off-by: Mr Maintainer <jdoe@example.com> (✓DKIM/kernel.org)
>  + Signed-off-by: Jane Maintainer <jdoe@example.com>
> 
> Tempting as it was to leave them in, I took them out :)

We should probably have something like "neverdomains" that includes
"example\..*", so I'm going to make a note of this.

-K
