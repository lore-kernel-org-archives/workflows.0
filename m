Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8381320FAB2
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509817; cv=none; b=eTMKKkEyPB4j0qXxOJi2USSmpMEX8fk9HX0ZnUge6Bxm2Ztg32XhfRNXEORSFv6BxPOki35/cjJUcfvGN3YBB6w5M8YtB1m2ORIggYLU7/keC67jCXmk7gmMY9TjBkpyoc5yTDR/mDmQ/c+4LwT+Noi6JA0v8piXFI5hsAQtWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509817; c=relaxed/simple;
	bh=/Z0/jn62DEolJsqyncJ3fuXBBZ0Gqa2solo8NxElD8I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ftOWn6QXMLlYXdRj4bwpuBGTXKB/f7buV/evXmFHAkKLTR8wjOIwIcRVPiTi7T6iLAGBsFZgEztpKYd2sYE1rNYpATshLPf+3Cwy0WEqtW9o1tr9UxvYrQPtVeAeff3Gn2ERZ7PLnFU6EyPAzMLs4n71HOi/IynbM7xnMikTsxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jr2HZiH4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jr2HZiH4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C80C4040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766509815; bh=Ipxo/v4FrIn4tUECCO3aZWkQf2XZj/sLIt3Q1X9eR1Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jr2HZiH4KkcfWb7y74RbZHeWBflnYiwu5WDwALmW8ZlOajODfaJXkbVojPffESJtN
	 EVR6YJq9rgYCeYn5HrjiNW6WKLwtJ1sgMD9BwkfD5lDQHSZ21c2pGF6fG1ldOw5pkL
	 5TVXYJUImVVwB6IkskLKvn4Lwo017g5oH1IPEW2SIyLzOLQAJ4yit4W2NAAYGpvCUI
	 RlF5WoVpEZ9taOVlb0Q3gRMcJNkldc7aryEvlYsddcLOtT75esJ/JSvO72XYbK14Wv
	 IDhy+eQrOjM5CLBGzSy6w2pBvob0nvN/ozW5Cm2yHZhalK6ECObTWb0Qutb2EHCkkD
	 ATApLtBTmqvlQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7C80C4040B;
	Tue, 23 Dec 2025 17:10:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steven Rostedt
 <rostedt@goodmis.org>
Cc: Kees Cook <kees@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, dave@sr71.net, Shuah Khan
 <shuah@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, NeilBrown
 <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan
 Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>, Sasha
 Levin <sashal@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
In-Reply-To: <2025122358-flyover-tidy-6f4d@gregkh>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
 <20251115140746.6a3acfd5@batman.local.home> <877bvqan70.ffs@tglx>
 <2804290.mvXUDI8C0e@rafael.j.wysocki>
 <EEF974E1-08D5-4E67-8AC4-4315CF9D10C1@kernel.org>
 <20251116111732.5159839e@batman.local.home>
 <2025122358-flyover-tidy-6f4d@gregkh>
Date: Tue, 23 Dec 2025 10:10:14 -0700
Message-ID: <87a4z9w2dl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> What's the status of this patch?  I don't see it in linux-next, is it
> supposed to go through some specific tree?

I've been assuming there would be another version after the meeting, so
haven't applied anything.  (Besides, between travel, 100mph winds, and
several days without power, I've not gotten much done in general...)

jon
