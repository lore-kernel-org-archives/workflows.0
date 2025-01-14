Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB31C2337;
	Tue, 14 Jan 2025 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736845272; cv=none; b=AXB65t4tyMYwzLD5C0bwNLbcXDYzm5I47crO4pSwGSZgXEH9eNuIRsFudY99w0dmcH3Py5YktGlEYQp+bQYh1Sp+OMeAQwvxSdCxFrthDHJPh8CN5KMgUtiTbSBfszMojjCUt/9ZyQbnSMQPLJwKjIXlJf10PD6OmcWFydCrhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736845272; c=relaxed/simple;
	bh=WFZWHIv2JNqgv4OoNpZlHIZEGEwWZ+p/WPZAl/LLJRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+xrRspP4k0jqDshMk5nLIbHTke35xk2mtP8n3BAJeKkTbRIajwfaAbzMtCUrmczDDJ7v/eS/mdgBdnT/SNuWQu2SzQbG4CoOtlh9jAYQ0ZfmzPaQFPoiTEwzGkUJ/MKKIbWN3e1B6lG105lmTEUgsX4c5HYYpaGeDap5C+qheU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=puHzgKGj; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=XT1amNvm; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=r3N2vzT5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=OW0TYyts; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="puHzgKGj";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XT1amNvm";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="r3N2vzT5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="OW0TYyts"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 68F7521195;
	Tue, 14 Jan 2025 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736845267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPAosxHOw81gzf7NQiU8vkvgOucWFUtk3cREATsF1ZM=;
	b=puHzgKGjB9CJqWLpM9ACNswhut1rUM9AhZyvPr0d1reeYM5JJiFcRiki0EgRNlmbb0xIhl
	DOjGn/ILD0LiIYVAzq2VC42QXI1JuLaccK3VnpeHjR/cP2oeJnfCvuv9jdwA8oSikKXkqY
	fdAQ5n+lKdoYM3ZjhHSfO2Feqm2hybE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736845267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPAosxHOw81gzf7NQiU8vkvgOucWFUtk3cREATsF1ZM=;
	b=XT1amNvmBCfiP15YGngCpD+YP7jbd0CQbZbAtIV1U+Hcqe4ucjC5ud9XXG1e1V8C0SvyKh
	ll1Vw1snFlHIxcBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736845266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPAosxHOw81gzf7NQiU8vkvgOucWFUtk3cREATsF1ZM=;
	b=r3N2vzT5sgofI4M98kB7ZBKjTycj2TF+QBT00iyrZolDoxbyqBpPFpKIzAyeK4rk/13EHq
	F6bfgytYVTBBrC54ri9YFCsVWWLetgCYW93Rnlhbq5Ubdm91KM8NfWiD1Ksts7I9oFbEUb
	5T9IxSV40o5+oVjh6sZ/A0hluqnFVLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736845266;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPAosxHOw81gzf7NQiU8vkvgOucWFUtk3cREATsF1ZM=;
	b=OW0TYytsvM77GZPC140Xc4DF2YveKSf1fuGRe7c3pIYMn2KTVhTTYFWdUge/C/gUUht3V5
	C+85WuVmis6mJUBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5563C13A98;
	Tue, 14 Jan 2025 09:01:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kO2VFNInhmf9bgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 14 Jan 2025 09:01:06 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 14 Jan 2025 09:57:55 +0100
Subject: [PATCH 2/2] get_maintainer: print subsystem status also for
 reviewers and lists
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-b4-get_maintainer-v1-2-ecf40f0d032d@suse.cz>
References: <20250114-b4-get_maintainer-v1-0-ecf40f0d032d@suse.cz>
In-Reply-To: <20250114-b4-get_maintainer-v1-0-ecf40f0d032d@suse.cz>
To: Joe Perches <joe@perches.com>
Cc: workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=WFZWHIv2JNqgv4OoNpZlHIZEGEwWZ+p/WPZAl/LLJRg=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBnhifP2cel0Ig9doQ9Hs2uAen0SFlFblD2sW9vJ
 l89BB/ANkaJATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCZ4YnzwAKCRC74LB10kWI
 mkYaB/4/lrNmlES8SwTb8XFph17347iSXNqj1shfPzMN1bu5932khNNcja6aYwmcYjSsSCJviZM
 jB2T3i5ffMNcMVI72Xui41Fa8Z3rvaAhY6pp1LcjAKUiUn7UujnBgBHY7wMq9Jp67ALKTz1BYZr
 WiFO2kP2PHXQXwotd2M9z/G/RfgahvNiOcraoGKc9/S5zbeqRL5qO96flmD1KGiRCfu9AT+qjNT
 pKeY1NXkP6tNpEzavNW02t8hoMoVqHD3dVROpFw5kOvujr0GVlSoXnPLy7mg1HGKtcQ456BHBD6
 9iiZlntMXfOlHgLS0IIwww6KD5FHArCVnDarYRKu18OYOfkK
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

When reporting maintainers, the subsystem information includes its
status (S: entry from MAINTAINERS) whenever it's not the most common one
(Maintained). However this status information is missing for reviewers
and especially for mailing lists, which may be often the only kind of
e-mail address reported for subsystems that are of Orphan status.

For completeness, include the status information also for reviewers and
lists in the same way as for maintainers. Implementation-wise, factor
out obtaining the subsystem status from get_maintainer_role to a new
function get_subsystem_status.

For the catch-all LKML L: entry defined in "THE REST" section, the
"subsystem" is kept ommitted and thus also its status "Buried alive in
reporters" is not reported.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 scripts/get_maintainer.pl | 61 ++++++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 24 deletions(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 82a0032f4d4c7dad876afeb601b5f1957d1a838f..c9373a21da2537181f5c9eb09bb901d1981cb0dc 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -1263,6 +1263,28 @@ sub find_ending_index {
     return $index;
 }
 
+sub get_subsystem_status {
+    my ($index) = @_;
+
+    my $i;
+    my $start = find_starting_index($index);
+    my $end = find_ending_index($index);
+
+    my $status = "unknown";
+    for ($i = $start + 1; $i < $end; $i++) {
+	my $tv = $typevalue[$i];
+	if ($tv =~ m/^([A-Z]):\s*(.*)/) {
+	    my $ptype = $1;
+	    my $pvalue = $2;
+	    if ($ptype eq "S") {
+		$status = $pvalue;
+	    }
+	}
+    }
+
+    return lc($status);
+}
+
 sub get_subsystem_name {
     my ($index) = @_;
 
@@ -1280,44 +1302,31 @@ sub get_subsystem_name {
 sub get_maintainer_role {
     my ($index) = @_;
 
-    my $i;
-    my $start = find_starting_index($index);
-    my $end = find_ending_index($index);
-
-    my $role = "unknown";
+    my $role = "maintainer";
     my $subsystem = get_subsystem_name($index);
-    my $substatus = "";
-
-    for ($i = $start + 1; $i < $end; $i++) {
-	my $tv = $typevalue[$i];
-	if ($tv =~ m/^([A-Z]):\s*(.*)/) {
-	    my $ptype = $1;
-	    my $pvalue = $2;
-	    if ($ptype eq "S") {
-		$role = $pvalue;
-	    }
-	}
-    }
+    my $status = get_subsystem_status($index);
 
-    $role = lc($role);
-    if ($role eq "maintained") {
-	$role = "maintainer";
-    } elsif ($role eq "buried alive in reporters") {
+    if ($status eq "maintained") {
+	$status = "";
+    } elsif ($status eq "buried alive in reporters") {
+	$status = "";
 	$role = "chief penguin";
     } else {
-	$substatus = " [" . $role . "]";
-	$role = "maintainer";
+	$status = " [" . $status . "]";
     }
-    return $role . ":" . $subsystem . $substatus;
+    return $role . ":" . $subsystem . $status;
 }
 
 sub get_list_role {
     my ($index) = @_;
 
     my $subsystem = get_subsystem_name($index);
+    my $status = get_subsystem_status($index);
 
     if ($subsystem eq "THE REST") {
 	$subsystem = "";
+    } elsif ($status ne "maintained") {
+	$subsystem .= " [" . $status . "]";
     }
 
     return $subsystem;
@@ -1382,6 +1391,10 @@ sub add_categories {
 	    } elsif ($ptype eq "R") {
 		if ($email_reviewer) {
 		    my $subsystem = get_subsystem_name($i);
+		    my $status = get_subsystem_status($i);
+		    if ($status ne "maintained") {
+			$subsystem .= " [" . $status . "]";
+		    }
 		    push_email_addresses($pvalue, "reviewer:$subsystem" . $suffix);
 		}
 	    } elsif ($ptype eq "T") {

-- 
2.47.1

