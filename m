Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=80x24.org header.i=@80x24.org header.b="Eg3YX1SD"
X-Greylist: delayed 341 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Nov 2023 16:16:09 PST
Received: from dcvr.yhbt.net (dcvr.yhbt.net [173.255.242.215])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40D71B8
	for <workflows@vger.kernel.org>; Mon, 27 Nov 2023 16:16:09 -0800 (PST)
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id 4ACAE1F406;
	Tue, 28 Nov 2023 00:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=80x24.org;
	s=selector1; t=1701130228;
	bh=Dp8HlBgb+cEGbZnATWUb2H00OaFo01M8FHg4W0Un6hA=;
	h=Date:From:To:Cc:Subject:From;
	b=Eg3YX1SDUWTb0OYO7IopekzEPGyri2v+llhpR+kvt8aYSdI5vCDMJeN/96kxn745h
	 3LY2Gd10KichF3zBqCya1DgcqWx2W/LhmbZWC8WOiH0+wSAwL29mYySrRUaLAr6pHG
	 m8dmVMacFsEnnejj0DXBw6RvXZ3GdSGpz6UZ+GCs=
Date: Tue, 28 Nov 2023 00:10:28 +0000
From: Eric Wong <e@80x24.org>
To: meta@public-inbox.org
Cc: workflows@vger.kernel.org
Subject: extra search flags and params? (ispatch, replycount, ...)
Message-ID: <20231128001028.M189230@dcvr>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Would they be useful?

It's not currently possible to quickly search for whether or not
a term (e.g. patchid:) is present in a Xapian document.  Having
the ability to do so would make it easier to find non-patch messages,
or easily filter down to cover letters, bot replies, etc...

Thus adding Xapian terms is probably necessary for that.

replycount would be useful for implementing search for
ANSWERED/UNANSWERED in IMAP.  However, proper indexing/reindex
could be a PITA due to out-of-order message reception.

I don't think any of these would be required to get "lei rediff"
working on entire patchsets, though (it only does individual
messages, currently).
