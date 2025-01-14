Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528681C3BFC;
	Tue, 14 Jan 2025 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736845271; cv=none; b=Q/2xkQnS4JkPzulRQO41yx+AijT4oGhtwSrNKrv1GjXff4tRxu5THLjRh5DbaWSEQbuDAE6MDEt7wqGbDheFjMbGZWNEvn8jKHW0Qeo7KH4pyvzBaQbs7TjB4BKdCGC0wYLWhG3xYwLZ73K6SnZWzoY9Cy48jV3Bex1bfUzBSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736845271; c=relaxed/simple;
	bh=Qafce4lxG3QvgdaPmTVdG7H4KBbnhHVimKNE3MWbx/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQl0ovVe5VoxX/VIPHh8Pvahq7jB7eEEqhD+hFzd4VbG2Or/VEEIO0pIlh5YWOJwsgC+I4Gd4ANUd3ctbvyj3F5SO9btfX3JI2FBsiGkInIDBg/Ib+NpSktAIzGiMUFJvMv30r0tVJg7afv6WhP2Wo6pR22vEo7K7yh/SfCpPIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=eSbHD62F; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=gxjOHjZp; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=tqTtd79+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=w/Desbwr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="eSbHD62F";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="gxjOHjZp";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="tqTtd79+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="w/Desbwr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5BDDB1F395;
	Tue, 14 Jan 2025 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736845267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wG0H5aGfvKUFJFFS7s9hwalOmOlJj5zejgLcL4kqYbw=;
	b=eSbHD62FNClly6U0xIlIgszH7SUaVrbBgLZdwItpvK8QHkNI/OQ+vpceXiR1905DGoXdiM
	mwep0eXHD6CsnA8XMGRqFaM0u8XlLW24atzrLHkj1h0vR56c+GWdXfd0lJB1lwWXTUeueV
	C/gSVlKGrZogVSNnGAK76cwbPANlHOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736845267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wG0H5aGfvKUFJFFS7s9hwalOmOlJj5zejgLcL4kqYbw=;
	b=gxjOHjZp6qmFx0Ecfc74qzx726O+xR21+qw3DGYRZ7mfDcxDTmmejmINpNJCirM+laI5rG
	y8jiBOkTbOE9EeAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736845266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wG0H5aGfvKUFJFFS7s9hwalOmOlJj5zejgLcL4kqYbw=;
	b=tqTtd79+7JN/8njNA/ASrGdRRCWBbv5AS04UAk0iYiFbsKqyF/zVw9QAFr/Rha0LTaK9as
	Bf5GG6eLNLXlNvOCM1HhpF6NRPX2C7Wv3Q157vmSR+BYaIcldNBeR22fw80YcAUjPoRg/Y
	Gl8wceSz/OH1OXudtTv3ITeapivTpX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736845266;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wG0H5aGfvKUFJFFS7s9hwalOmOlJj5zejgLcL4kqYbw=;
	b=w/DesbwrD0gguIc0NQbhrP5zmRcgbmuq224N5gQ8K3+cv8cL/x01B4/svul2e/oX0HALQ3
	umbQJiK9ir6yFhAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47D6213A86;
	Tue, 14 Jan 2025 09:01:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0P9BEdInhmf9bgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 14 Jan 2025 09:01:06 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 14 Jan 2025 09:57:54 +0100
Subject: [PATCH 1/2] get_maintainer: decouple subsystem status from
 maintainer role
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-b4-get_maintainer-v1-1-ecf40f0d032d@suse.cz>
References: <20250114-b4-get_maintainer-v1-0-ecf40f0d032d@suse.cz>
In-Reply-To: <20250114-b4-get_maintainer-v1-0-ecf40f0d032d@suse.cz>
To: Joe Perches <joe@perches.com>
Cc: workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=Qafce4lxG3QvgdaPmTVdG7H4KBbnhHVimKNE3MWbx/Y=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBnhifMHlN6KR7aAwiEO744WP/9OWORsIbmCY3Jn
 84iWeYpepyJATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCZ4YnzAAKCRC74LB10kWI
 mszVB/9Z0p/mM0l1fbfgYgnQ5xxIJd08o+1QMacwIBIFI1PhUxmJHRimBphKCmOzntbZxhfGran
 Ji6Ru2ZM3OYUL/XqvTihoUefbl81kLqa6jUfiH3SsnvFXOmwmRvsM4mOSVZKKsJQtdJ829cauHH
 TtkvWwTj1nWCrTqZ4llWuEjqk5Uui04+YGZ6kgVgK+7kAWAbJ8lhStbSULKScnmXJ2jjAUntZo/
 uUxL9RKkXFNJZjWgvSHEP95hqqf4OC4V5A0Ql0Jmzhn6rX1IinjffOzC67H7vC39ZnBJF+ARgB7
 3G4y6ezL5SEDbroLR5x6SQjaIrlbofy68q+wMoTQrk2TpzQJ
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Level: 

The script currently uses the subystem's status (S: field in
MAINTAINERS) to change how maintainers are reported. One prominent
example is when the status is Supported, the maintainers are reported as
"(supporter:SUBSYSTEM)".

This is misleading, as the Supported status defined as "Someone is
actually paid to look after this." may not in fact apply to everyone
listed as a maintainer, but only to a subset.

It has also been confusing people about what "supporter" means and has
required updates to the documentation [1].

Thus stop applying the subsystem status to change "maintainer:" to
anything else, as maintainers are maintainers. Instead, if the subsystem
status is not the most common one (Maintained), indicate it as part of
the subsystem name. So for example, instead of "(supporter:SUBSYSTEM)"
report "(maintainer:SUBSYSTEM [supported])".

The only exception not changed here is the status "Buried alive in
reporters" used only in "THE REST" section and reported as "chief
penguin" because the script uses the same terminology also for the
corresponding (non-default) command line option.

[1] https://lore.kernel.org/all/20221006162413.858527-1-bryan.odonoghue@linaro.org/

Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 scripts/get_maintainer.pl | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 5ac02e19873722d0f5bf3ac8de8374338c7bddc3..82a0032f4d4c7dad876afeb601b5f1957d1a838f 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -1286,6 +1286,7 @@ sub get_maintainer_role {
 
     my $role = "unknown";
     my $subsystem = get_subsystem_name($index);
+    my $substatus = "";
 
     for ($i = $start + 1; $i < $end; $i++) {
 	my $tv = $typevalue[$i];
@@ -1299,21 +1300,15 @@ sub get_maintainer_role {
     }
 
     $role = lc($role);
-    if      ($role eq "supported") {
-	$role = "supporter";
-    } elsif ($role eq "maintained") {
+    if ($role eq "maintained") {
 	$role = "maintainer";
-    } elsif ($role eq "odd fixes") {
-	$role = "odd fixer";
-    } elsif ($role eq "orphan") {
-	$role = "orphan minder";
-    } elsif ($role eq "obsolete") {
-	$role = "obsolete minder";
     } elsif ($role eq "buried alive in reporters") {
 	$role = "chief penguin";
+    } else {
+	$substatus = " [" . $role . "]";
+	$role = "maintainer";
     }
-
-    return $role . ":" . $subsystem;
+    return $role . ":" . $subsystem . $substatus;
 }
 
 sub get_list_role {

-- 
2.47.1

