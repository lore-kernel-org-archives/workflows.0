Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B371DFE8
	for <workflows@vger.kernel.org>; Fri,  9 Feb 2024 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707481479; cv=none; b=bhfjruXAFWX+0cKjSa4kmRYg1Rb4YmWobg1wMvR4/VneRjmfzBQyoAjaEeH7zd9Ccx5f0afsVzGW3hh/R1OEKOWMUZnWvqwa48RZ0IAlZ25m3fwnYHfW+PXlDqzcpGWYENl5Wol8lnGbxrP0WMvDcugXhqhnbC1qqUQ+QynI0e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707481479; c=relaxed/simple;
	bh=+Ahm8i28zg3TiaospR0NOsWzbt14Q+LpdE0Nz8BKSLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJiecxQD04RVfvGgZw6ejWnd4jddWBVeaJDh9/KuC9lfcPybuMc5v4c5Df1bn57QSLfW9YwBdaZp/f8t2mEVXvRN2tENVJFz+1rdPnHgq3tKldFclajdlpO96jNXdkcPjBvFvR/ys4azkPqYZ46SUFX84SxThSDHs53W58ZY7xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=itmNBwhk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="itmNBwhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707481476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TX9G/KsNPAz5I+4uSJrj22jg+5OH3ngaBD15l+KFK1g=;
	b=itmNBwhkozletY8sOv8th5xxdMBo+NlJrEihM9+brEODeeMeKoISPync/tF6TH1Dmv+8fx
	KWmkau18EFl9n/sBa1PCAJMT5MNkcTFbGGIR+DpzE05L9MGA6+g7gl130v7l+Y0BUNaxvu
	pXce/sD9Ehoe53uXrZOeekJw0lfl/Dc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-gqURgv6TNIWyNFLFaXmRUg-1; Fri, 09 Feb 2024 07:24:32 -0500
X-MC-Unique: gqURgv6TNIWyNFLFaXmRUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39AD5811E79;
	Fri,  9 Feb 2024 12:24:32 +0000 (UTC)
Received: from ruby.redhat.com (unknown [10.39.194.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5209111215;
	Fri,  9 Feb 2024 12:24:31 +0000 (UTC)
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
To: workflows@vger.kernel.org,
	Joe Perches <joe@perches.com>
Cc: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Subject: [PATCH] get_maintainer: Survive querying missing files
Date: Fri,  9 Feb 2024 14:24:18 +0200
Message-ID: <20240209122418.229144-1-Nikolai.Kondrashov@redhat.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Do not die, but only warn when scripts/get_maintainer.pl is asked to
retrieve information about a missing file.

This allows scripts/checkpatch.pl to query MAINTAINERS while processing
patches which are removing files.

For example take:

    commit ebb0130dad75 ("dt-bindings: mailbox: convert bcm2835-mbox bindings to YAML")

It removes a file (and recreates it in another format, but that's
besides the point) which belongs to four subsystems.

This will work OK:

    scripts/get_maintainer.pl \
        0001-dt-bindings-mailbox-convert-bcm2835-mbox-bindings-to.patch

But if we try to give the file being removed to get_maintainer.pl
directly:

    scripts/get_maintainer.pl \
        -f Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt

It will abort with the following message:

    scripts/get_maintainer.pl: file
    'Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt'
    not found

Even though the state of the source tree we're running this on is
*exactly* the same.

This commit downgrades that error to a warning.

Signed-off-by: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
---
 scripts/get_maintainer.pl | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index ee1aed7e090ca..35e888e3c1889 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -542,7 +542,11 @@ foreach my $file (@ARGV) {
 	if ((-d $file)) {
 	    $file =~ s@([^/])$@$1/@;
 	} elsif (!(-f $file)) {
-	    die "$P: file '${file}' not found\n";
+	    if ($from_filename) {
+		warn "$P: file '${file}' not found\n";
+	    } else {
+		die "$P: file '${file}' not found\n";
+	    }
 	}
     }
     if ($from_filename && (vcs_exists() && !vcs_file_exists($file))) {
-- 
2.43.0

