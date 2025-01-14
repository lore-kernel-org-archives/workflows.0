Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528D622ACF7;
	Tue, 14 Jan 2025 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736845271; cv=none; b=DRPyvCCv5qHOaO1ip5AxGQQxD/yVCEd8sffIMqLKLwzwRaMB1oZJ1CkAorIQ1leKI6TIi3RL0sDxeLRYKhhwc22YOprQzVSVYzh6iKeo7MZKks77bG/QA/5AsEbQuKk6LCKA2p8tU5ELaGFrLHofJSHlJr1wqS2MUjtQUHkENvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736845271; c=relaxed/simple;
	bh=4gnaR5N0v5tHE718JKjAj07uiJo7SoKi48FEpVLZgCY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q8dMG5oPPe+9Eb5NFVzRxTsnDHO4MFJyKmL9DoCriaVDDis6diTODS31bVY+wuhfcf+c4Ea1SorO/kf8ZWJVDgmZMAeR+zYlAkqiv6MH5b/JUeirZSutNFEeJT+SK25ley8eenF47vTFkNRS4rXz+P+QC6ASep1iLgdIU4Z1DJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=fMbOw8V4; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=nNNyhrs4; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=s/TcqkU1; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zEIzteXC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="fMbOw8V4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="nNNyhrs4";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="s/TcqkU1";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zEIzteXC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D9E31F38F;
	Tue, 14 Jan 2025 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736845267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fgu17gyK/bG7+xOVrRdx+1izrCsbDH+D5Neuxdkoo+s=;
	b=fMbOw8V4JQ4RSD9WFgobQeb2LpdOW+VvB/SDNYGDfOKF7j/suO+lqNy5F4iFAlncm7tenW
	RjmhqWJzoC0ZU73FpxV6qaurq8SoBo8hAJx3h1OcNt0mRqG7bNk+gFrZ8sA973pMR2a0OE
	UgnC97weKq9K31aWMHCmU7sFdlBboSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736845267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fgu17gyK/bG7+xOVrRdx+1izrCsbDH+D5Neuxdkoo+s=;
	b=nNNyhrs4yY5in8ws9xa3LjL1IRPTeWPoL+5WTI9CC4f70caM3KiUSF6oBGr09uiEJV8tNO
	YqRmZp5a/gGTnKBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="s/TcqkU1";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=zEIzteXC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736845266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fgu17gyK/bG7+xOVrRdx+1izrCsbDH+D5Neuxdkoo+s=;
	b=s/TcqkU1Xn+ORq2TME63gSUP8qHWdIlB4KIqPS6JNm7GO3bnOsTu1NWa3cbTBGaaPVgpSp
	tLBVmbID+HLcuHe90LqAKvZL2aWuJBF80+qHFMVKzRam+jxkF5QTt+Lkl5c8swnnQAuXdA
	iXe/VLaB+1X54bc2PlAQuiD8NwmORrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736845266;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fgu17gyK/bG7+xOVrRdx+1izrCsbDH+D5Neuxdkoo+s=;
	b=zEIzteXCxzdgotxhZWGZciPEnXBVkTDFrJ0HsxOn9d63Ta4AMrjtlbwI2gobOIT4UScU3K
	VpQydjxu9eQo+8Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38A6D1384C;
	Tue, 14 Jan 2025 09:01:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b119DdInhmf9bgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 14 Jan 2025 09:01:06 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 0/2] get_maintainer: report subsystem status separately
 from maintainer role
Date: Tue, 14 Jan 2025 09:57:53 +0100
Message-Id: <20250114-b4-get_maintainer-v1-0-ecf40f0d032d@suse.cz>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABEnhmcC/x2MQQqAIBAAvxJ7bkFTIfpKRJhttocsNCKI/t7SY
 Q5zmHmgUGYq0FUPZLq48J5EdF1BWH2KhDyLQ6Map7S2OFmMdI6b53QKlDEEY1w7UauDAumOTAv
 f/7Mf3vcDDKoqmmMAAAA=
X-Change-ID: 20250114-b4-get_maintainer-cc3358be81c0
To: Joe Perches <joe@perches.com>
Cc: workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2233; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=4gnaR5N0v5tHE718JKjAj07uiJo7SoKi48FEpVLZgCY=;
 b=kA0DAAgBu+CwddJFiJoByyZiAGeGJ8iikRosYsPgJSoA6/4GpB7oylGM1gQhqRpMwpORzHDE8
 4kBMwQAAQgAHRYhBHu7yEEVmSNIlkhN8bvgsHXSRYiaBQJnhifIAAoJELvgsHXSRYiaFNAH/1dT
 ootspT+WuozDo8/LsnCCL+WDAU0XuV6dd6SU3eVPJLa2519607f5bNEN8upoxeNedrxs+VS57/N
 mXctKJL/SCcE+1PttK9Xu5e77Sj3CcqzSUC5fzaC/0luNdRMCvDFoxI9T3IKmnkTNGHA2vJNIfy
 TaQY2Wq+gFGpdqDM52Qdwd+ZxI9vPoybf/2wTTHBkSKidyaN7nmgvUkT9WTCsnTSGijxjLdQCPR
 6YCE6FgFStgcFTLYv+nAZETgsDZRoOschZSbkkjo8uP6HfxuA9jmgt6quNSgvjbsDyiCzyq2p/W
 2HDqUc5EvpeTKrheO77QBXhYNxi+g6x/ED38CBI=
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Rspamd-Queue-Id: 4D9E31F38F
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:email,suse.cz:dkim,suse.cz:mid];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

The script currently uses the subystem's status (S: field) to change how
maintainers are reported. One prominent example is when the status is
Supported, the maintainers are reported as "(supporter:SUBSYSTEM)".

I have been confused myself in the past seeing "supporter" and have seen
somebody recently wondering what it means as well.

I have read the threads from 2022 that in the end resulted in adjusting
documentation only [1]. I very much agree with Ted's points about taking
the subsystem status and applying it to all maintainers being wrong [2].

The attempt to modify get_maintainer output was retracted after Joe
objected that the status becomes not reported at all [3]. This series
addresses that by reporting the status (unless it's the most common
Maintained one) as part of the subsystem name.

Given this new approach, the next logical step is to do the same also
for reporting reviewers and mailing lists. In fact, subsystems with an
Orphan status some catch-all mailing list and no maintainers, so the
"(orphan minder:SUBSYSTEM)" would never be currently reported by
get_maintainer.  The second patch thus adds reporting the subsystem
status in the same way for lists (and reviewers).

Changes since RFC [4]
- keep the special handling for THE REST section ("chief penguin")
- added patch 2 for reviewers and mailing lists
- R-b on patch 1 from Kees

[1] https://lore.kernel.org/all/20221006162413.858527-1-bryan.odonoghue@linaro.org/
[2] https://lore.kernel.org/all/Yzen4X1Na0MKXHs9@mit.edu/
[3] https://lore.kernel.org/all/30776fe75061951777da8fa6618ae89bea7a8ce4.camel@perches.com/
[4] https://lore.kernel.org/all/20241213112921.180978-2-vbabka@suse.cz/

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
Vlastimil Babka (2):
      get_maintainer: decouple subsystem status from maintainer role
      get_maintainer: print subsystem status also for reviewers and lists

 scripts/get_maintainer.pl | 68 ++++++++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 30 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20250114-b4-get_maintainer-cc3358be81c0

Best regards,
-- 
Vlastimil Babka <vbabka@suse.cz>

