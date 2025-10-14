Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D82D73BF
	for <workflows@vger.kernel.org>; Tue, 14 Oct 2025 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426132; cv=none; b=ef33TKLfbpfe8HhOEk/yQc6mKtzOZPGF89l47Itfq4NX1UchoSlbWAEbuPxL0zwiL2iXgqeNLE1yan5oh7TtMWWpT+HPiPSnUz2OOMl/ODLlGMty8203C1LC4y2UlhvVDHgFyUib/8VOZ6BDVKpxy1om0IENORopweQHVTzUqUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426132; c=relaxed/simple;
	bh=DmefgkSt1a02szCHnvnKJ+LXXtJpC/QW04yYN4LCOes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGCS0G66ltoqoQDkVgAsRNsvb4aJnLpZm1JQrd6F1zRS/WjiW0pW8EnwgVyPiuz+r7+Cq1elySXheNQ2JH8GdZvp0eifxekcHKJfRryitf1JA/PIL/BIfsXfyYb9owJPtPBIAP6XDcWTuzhhtzCYpu4iE8X3XVxl7DETK+BM2FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3RM+jpK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3RM+jpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426130; x=1791962130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DmefgkSt1a02szCHnvnKJ+LXXtJpC/QW04yYN4LCOes=;
  b=I3RM+jpKM4fviNm9D+2CRTnHQBgXKxrzyyKLJb/um4cW/CDQWNzz6SO+
   MSOP4wC/huqVuVfUzYMcTSqP2p1JgakYxVFcDuPejiFq6zW+kMCRXgDUQ
   UUqoRovCbS4iAzWPA33KOq3PaZObDTOq63eEjrDe8Z7uh6RVsPn5gKl6J
   VXRDveN51nZfUfCDfZwW3QnCqDDulUWIb46WZ0a0j9itw11rPJyBX4btQ
   Nh9RmWDbguyZaiyqiQ0LG/GCfvIg8sD/flmaLrwpwTOwBuxhjDxl+W+rQ
   Yh8XQcHR/xvhzCeRhvo9N4STrpM29xX59v3heSiazsenXpJMkzKSGdPV0
   w==;
X-CSE-ConnectionGUID: Vv4nRnAvSbqcF6QRfQadOg==
X-CSE-MsgGUID: TZqeqZTXRkCigZls519V4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233796"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233796"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:15:29 -0700
X-CSE-ConnectionGUID: oXtPkBmaTHq7W5tHuBYIXQ==
X-CSE-MsgGUID: DtUDxZ0FRN+Fw9wQsD8gww==
X-ExtLoop1: 1
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2025 00:15:28 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: konstantin@linuxfoundation.org
Cc: ksummit@lists.linux.dev,
	workflows@vger.kernel.org
Subject: [PATCH 1/3] b4: Move linktrailer to a LoreMessage property
Date: Tue, 14 Oct 2025 00:15:28 -0700
Message-ID: <20251014071530.3665691-2-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014071530.3665691-1-dan.j.williams@intel.com>
References: <20251014071530.3665691-1-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for appending Link: trailers as 'git notes'. Arrange for a
submission link trailer to be a property of a message object.

Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 src/b4/__init__.py | 48 ++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ffa7a5d5c7d9..c608a4d7956a 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -715,27 +715,7 @@ class LoreSeries:
             if lmsg is not None:
                 extras = list()
                 if addlink:
-                    linktrailer = None
-                    ltrmask = config.get('linktrailermask')
-                    if ltrmask and isinstance(ltrmask, str):
-                        if ltrmask.find(':'):
-                            lparts = ltrmask.split(':', maxsplit=1)
-                            llname = lparts[0].strip()
-                            llval = lparts[1].strip() % lmsg.msgid
-                            linktrailer = LoreTrailer(name=llname, value=llval)
-                        else:
-                            logger.critical('linktrailermask does not look like a valid trailer, using defaults')
-
-                    if not linktrailer:
-                        defmask = LOREADDR + '/r/%s'
-                        cfg_llval = config.get('linkmask', defmask)
-                        if isinstance(cfg_llval, str) and '%s' in cfg_llval:
-                            linktrailer = LoreTrailer(name='Link', value=cfg_llval % lmsg.msgid)
-                        else:
-                            logger.critical('linkmask does not look like a valid mask, using defaults')
-                            linktrailer = LoreTrailer(name='Link', value=defmask % lmsg.msgid)
-
-                    extras.append(linktrailer)
+                    extras.append(lmsg.linktrailer)
 
                 if attsame and not attcrit:
                     if attmark:
@@ -1258,6 +1238,7 @@ class LoreMessage:
         self._git_patch_id: Optional[str] = None
         self._pwhash: Optional[str] = None
         self._blob_indexes: Optional[Set[Tuple[str, str, str, str]]] = None
+        self._linktrailer: Optional[str] = None
 
         # Handle [PATCH 6/5]
         if self.counter > self.expected:
@@ -1399,6 +1380,31 @@ class LoreMessage:
                 self._blob_indexes = set()
         return self._blob_indexes
 
+    @property
+    def linktrailer(self) -> Optional[str]:
+        if self._linktrailer is None:
+            config = get_main_config()
+            ltrmask = config.get('linktrailermask')
+            if ltrmask and isinstance(ltrmask, str):
+                if ltrmask.find(':'):
+                    lparts = ltrmask.split(':', maxsplit=1)
+                    llname = lparts[0].strip()
+                    llval = lparts[1].strip() % self.msgid
+                    self._linktrailer = LoreTrailer(name=llname, value=llval)
+                else:
+                    logger.critical('linktrailermask does not look like a valid trailer, using defaults')
+
+            if self._linktrailer is None:
+                defmask = LOREADDR + '/r/%s'
+                cfg_llval = config.get('linkmask', defmask)
+                if isinstance(cfg_llval, str) and '%s' in cfg_llval:
+                    self._linktrailer = LoreTrailer(name='Link', value=cfg_llval % self.msgid)
+                else:
+                    logger.critical('linkmask does not look like a valid mask, using defaults')
+                    self._linktrailer = LoreTrailer(name='Link', value=defmask % self.msgid)
+
+        return self._linktrailer
+
     @property
     def attestors(self) -> List['LoreAttestor']:
         if self._attestors is not None:
-- 
2.51.0

